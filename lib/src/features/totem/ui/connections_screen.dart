import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/totem/application/totem_scans_notifier.dart';
import 'package:wom_pocket/src/features/totem/ui/widgets/totem_tile.dart';

BitmapDescriptor? standardPin;

Future<BitmapDescriptor> getPosPin() async {
  return await BitmapDescriptor.asset(
    ImageConfiguration(devicePixelRatio: 1),
    'assets/images/wom_pos_pin.png',
  );
}

class SelectPictureModal extends StatelessWidget {
  final Function()? onRemove;

  const SelectPictureModal({this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'totem_scan_screen.select_image_source'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 24),
          InkWell(
            onTap: () {
              context.maybePop(false);
              // Navigator.of(context).pop(false);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  Icon(Icons.camera),
                  const SizedBox(width: 16),
                  Text('camera'.tr()),
                ],
              ),
            ),
          ),
          // const SizedBox(height: 16),
          InkWell(
            onTap: () {
              context.maybePop(true);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 16.0,
              ),
              child: Row(
                children: [
                  Icon(Icons.photo),
                  const SizedBox(width: 16),
                  Text('gallery'.tr()),
                ],
              ),
            ),
          ),
          if (onRemove != null)
            InkWell(
              onTap: () {
                onRemove?.call();
                context.maybePop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 16.0,
                ),
                child: Row(
                  children: [
                    Icon(Icons.clear, color: Colors.red),
                    const SizedBox(width: 16),
                    Text('remove_current_image'.tr()),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class TotemScansScreen extends ConsumerWidget {
  const TotemScansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PocketAppBar(
        // title: 'connections'.tr(),
        actions: [
          IconButton(
            color: primaryColor,
            onPressed: () {
              context.go('/totem/search');
            },
            icon: Icon(Icons.search),
          ),
          const SizedBox(width: 8),
          IconButton(
            color: primaryColor,
            onPressed: () {
              context.go('/totem/account');
            },
            icon: Icon(Icons.account_circle),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: MyTabBar(),
      /*switch (state) {
        AsyncData(:final value) => value.isEmpty
            ? Center(
                child: Text(
                  'totem_scan_screen.no_scan'.tr(),
                ),
              )
            : ListView(
                children: [
                  for (int i = 0; i < value.keys.length; i++) ...[
                    _Header(t: value[value.keys.elementAt(i)]!.first),
                    for (int k = 0;
                        k < value[value.keys.elementAt(i)]!.length;
                        k++)
                      _Item(
                        t: value[value.keys.elementAt(i)]![k],
                      ),
                    Divider(),
                  ],
                ],
              ),
        _ => Center(
            child: CircularProgressIndicator(),
          )
      },*/
    );
  }
}

class MyTabBar extends ConsumerStatefulWidget {
  const MyTabBar({super.key});

  @override
  ConsumerState createState() => _MyTabBarState();
}

class _MyTabBarState extends ConsumerState<MyTabBar>
    with SingleTickerProviderStateMixin {
  // late final myContactsWidget = MyContactsList();

  late final TabController controller;

  @override
  initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final selectedStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: primaryColor);
    final unselectedStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: Colors.grey);
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight,
          child: TabBar(
            labelStyle: selectedStyle,
            unselectedLabelStyle: unselectedStyle,
            dividerColor: primaryColor,
            indicatorColor: primaryColor,
            controller: controller,
            tabs: [
              Center(child: Text('events'.tr())),
              Center(
                child: Text(
                  'I miei contatti',
                  // style: unselectedStyle,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [MyEventList(), const MyContactsList()],
          ),
        ),
      ],
    );
  }
}

class MyEventList extends ConsumerWidget {
  const MyEventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getEventTotemsProvider);
    return switch (state) {
      AsyncData(:final value) =>
        value.isEmpty
            ? Center(child: Text('totem_scan_screen.no_scan'.tr()))
            : ListView(
                children: [
                  for (int i = 0; i < value.keys.length; i++) ...[
                    _Header(t: value[value.keys.elementAt(i)]!.first),
                    for (
                      int k = 0;
                      k < value[value.keys.elementAt(i)]!.length;
                      k++
                    )
                      TotemTile(t: value[value.keys.elementAt(i)]![k]),
                    Divider(),
                  ],
                ],
              ),
      _ => Center(child: CircularProgressIndicator()),
    };
  }
}

class MyContactsList extends ConsumerStatefulWidget {
  const MyContactsList({super.key});

  @override
  ConsumerState createState() => _MyContactsListState();
}

class _MyContactsListState extends ConsumerState<MyContactsList>
    with AutomaticKeepAliveClientMixin {
  bool? sortByAlpha = true;
  bool? sortByTimestamp = null;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getMyContactTotemsProvider);

    return switch (state) {
      AsyncData(:final value) =>
        value.isEmpty
            ? Center(child: Text('totem_scan_screen.no_scan'.tr()))
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Text('sort_by'.tr()),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (sortByAlpha != null) {
                                sortByAlpha = !sortByAlpha!;
                              } else {
                                sortByAlpha = true;
                              }
                              sortByTimestamp = null;
                            });
                          },
                          icon: Icon(
                            sortByAlpha != false
                                ? MdiIcons.sortAlphabeticalAscending
                                : MdiIcons.sortAlphabeticalDescending,
                            color: sortByAlpha != null
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (sortByTimestamp != null) {
                                sortByTimestamp = !sortByTimestamp!;
                              } else {
                                sortByTimestamp = true;
                              }
                              sortByAlpha = null;
                            });
                          },
                          icon: Icon(
                            sortByTimestamp != false
                                ? MdiIcons.sortCalendarAscending
                                : MdiIcons.sortCalendarDescending,
                            color: sortByTimestamp != null
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final list = value.toList();

                        if (sortByAlpha == false) {
                          list.sort(
                            (b, a) =>
                                a.totemName?.compareTo(b.totemName ?? '') ?? 1,
                          );
                        } else if (sortByTimestamp == true) {
                          list.sort(
                            (a, b) => a.timestamp.compareTo(b.timestamp),
                          );
                        } else if (sortByTimestamp == false) {
                          list.sort(
                            (b, a) => a.timestamp.compareTo(b.timestamp),
                          );
                        } else {
                          list.sort(
                            (a, b) =>
                                a.totemName?.compareTo(b.totemName ?? '') ?? 1,
                          );
                        }
                        return ListView(
                          children: [
                            for (int k = 0; k < list.length; k++)
                              TotemTile(t: list[k]),
                            Divider(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
      _ => Center(child: CircularProgressIndicator()),
    };
  }
}

class _Header extends StatelessWidget {
  final TotemRow t;

  const _Header({required this.t});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 4),
      child: Text(
        '${t.eventName ?? 'Evento'}${t.sessionName.isNullOrEmpty ? '' : ' | ${t.sessionName}'}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class InlineEditableText extends StatefulWidget {
  const InlineEditableText({
    required this.text,
    required this.onSubmitted,
    this.hint,
    this.style,
    this.emptyStyle,
    Key? key,
  }) : super(key: key);

  final String? hint;
  final String? text;
  final TextStyle? style;
  final TextStyle? emptyStyle;
  final Function(String) onSubmitted;

  @override
  State<InlineEditableText> createState() => _InlineEditableTextState();
}

class _InlineEditableTextState extends State<InlineEditableText> {
  var _isEditing = false;
  final _focusNode = FocusNode();
  late var _text = widget.text;
  late TextEditingController _controller;
  var showEmpty = false;

  @override
  void initState() {
    showEmpty = widget.text == null && (_text == null || _text!.isEmpty);
    _controller = TextEditingController(text: _text ?? widget.hint);
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() => _isEditing = false);
      } else {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.value.text.runes.length,
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() {
        _isEditing = !_isEditing;
        _focusNode.requestFocus();
      }),
      child: TextField(
        minLines: 1,
        maxLines: 4,
        style: showEmpty ? widget.emptyStyle : widget.style,
        focusNode: _focusNode,
        controller: _controller,
        textInputAction: TextInputAction.done,
        onChanged: (changed) {
          if (changed.isEmpty && !showEmpty) {
            setState(() {
              showEmpty = true;
            });
          } else if (changed.isNotEmpty && showEmpty) {
            setState(() {
              showEmpty = false;
            });
          }
        },
        onSubmitted: (changed) {
          widget.onSubmitted(changed);
          if (changed.isEmpty) {
            _controller.text = widget.hint ?? '';
          }
          setState(() {
            _text = changed.isEmpty ? null : changed;
            _isEditing = false;
          });
        },
        showCursor: _isEditing,
        cursorColor: Colors.black,
        enableInteractiveSelection: _isEditing,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 4.4,
          ),
          border: _isEditing
              ? const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                )
              : InputBorder.none,
        ),
      ),
    );
  }
}
