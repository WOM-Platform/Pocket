import 'package:pocket/src/db/wom_db.dart';
import 'package:pocket/src/screens/map/blocs/google_map_bloc.dart';
import 'package:pocket/src/screens/map/widgets/backdrop_bar.dart';
import 'package:pocket/src/screens/map/widgets/backdrop_body.dart';
import 'package:pocket/src/screens/map/widgets/map_widget.dart';
import 'package:pocket/src/widgets/woms_card_by_aim.dart';
import 'package:pocket/src/screens/map/widgets/backdrop_panel.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey _backdropKey = GlobalKey(debugLabel: 'Backdrop');
  AnimationController _controller;
  final GoogleMapBloc bloc = GoogleMapBloc(WomDB.get());
  bool isMapVisible = true;

  Widget mapWidget;
  Widget listAggregatedWom;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );

    mapWidget = MapWidget(bloc: bloc);
    listAggregatedWom = ListAggregatedWomCard(bloc: bloc);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _backdropPanelVisible {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }

  void _toggleBackdropPanelVisibility() {
    _controller.fling(velocity: _backdropPanelVisible ? -2.0 : 2.0);
  }

  double get _backdropHeight {
    final RenderBox renderBox = _backdropKey.currentContext.findRenderObject();
    return renderBox.size.height;
  }

  //metodo chiamato mentre si fa uno swipe continuo sullo schermo
  void _handleDragUpdate(DragUpdateDetails details) {
    if (_controller.isAnimating) return;

    //spostiamo il backdrop in verticale
    _controller.value +=
        details.primaryDelta / (_backdropHeight ?? details.primaryDelta);
  }

  //chiamato quando termina lo swipe
  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    //in base alla velocità continuo l animazione nel giusto verso
    // per completarla
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / _backdropHeight;
    if (flingVelocity > 0.0)
      _controller.fling(velocity: math.max(2.0, -flingVelocity));
    else if (flingVelocity < 0.0)
      _controller.fling(velocity: math.min(-2.0, -flingVelocity));
    else
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
  }

  Widget _buildStack(BuildContext context, BoxConstraints constraints) {
    const double panelTitleHeight = 48.0;
    final Size panelSize = constraints.biggest;
    final double panelTop = panelSize.height - panelTitleHeight;

    final Animation<RelativeRect> panelAnimation = _controller.drive(
      RelativeRectTween(
        end: RelativeRect.fromLTRB(
          0.0,
          panelTop - MediaQuery.of(context).padding.bottom,
          0.0,
          panelTop - panelSize.height,
        ),
        begin: RelativeRect.fromLTRB(0.0, panelTop / 2 - 50.0, 0.0, 0.0),
      ),
    );

    return Container(
      key: _backdropKey,
      child: Stack(
        children: <Widget>[
          mapWidget,
          isMapVisible
              ? Container()
              : Container(
                  color: Colors.white,
                  child: listAggregatedWom,
                ),
          PositionedTransition(
            rect: panelAnimation,
            child: BackdropPanel(
              onTap: _toggleBackdropPanelVisibility,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              title: BackdropBar(bloc: bloc),
              child: BackdropBody(bloc),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mappa'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.view_list),
            onPressed: () {
              setState(() {
                isMapVisible = !isMapVisible;
              });
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: _buildStack,
      ),
    );
  }
}

class ListAggregatedWomCard extends StatelessWidget {
  final GoogleMapBloc bloc;

  const ListAggregatedWomCard({Key key, @required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WomGroupBy>>(
      future: bloc.fetchGroupedWoms(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final woms = snapshot.data;

        return ListView.builder(
          itemCount: woms.length,
          itemBuilder: (context, index) {
            print("build Wom Card");
            return WomGroupCard(
              wom: woms[index],
            );
          },
        );
      },
    );
  }
}
