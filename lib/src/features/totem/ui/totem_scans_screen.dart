import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/application/transaction_notifier.dart';
import 'package:wom_pocket/src/features/totem/application/totem_scans_notifier.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map_notifier.dart';
import 'package:wom_pocket/src/screens/transaction/transaction_screen.dart';
import 'package:wom_pocket/src/widgets/my_appbar.dart';

final formatter = DateFormat('dd/MM/yyyy HH:mm');

class TotemScansScreen extends ConsumerWidget {
  const TotemScansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getScannedTotemsProvider);
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: 'Totems',
      ),
      body: switch (state) {
        AsyncData(:final value) => value.isEmpty
            ? Center(
                child: Text(
                  'totem_scan_screen.no_scan'.tr(),
                ),
              )
            : ListView.separated(
                itemCount: value.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (context, index) {
                  final t = value[index];
                  return ListTile(
                    onTap: t.latitude != null && t.longitude != null
                        ? () {
                            final latLng = LatLng(t.latitude!, t.longitude!);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => _TotemMapScreen(
                                  latLng: latLng,
                                  totemName: t.totemName ?? 'Totem',
                                  eventName: t.eventName ?? 'Evento',
                                  sessionName: t.sessionName ?? 'Sessione',
                                  timestamp: t.timestamp,
                                  womLink: t.womLink,
                                  womPin: t.womPin,
                                  providerName: t.providerName ?? '',
                                ),
                              ),
                            );
                          }
                        : null,
                    isThreeLine: true,
                    title: Text(
                        '${t.eventName ?? 'Evento'}${t.sessionName != null ? ' | ${t.sessionName}' : ''}'),
                    subtitle: Text(
                      '${t.totemName != null ? '${t.totemName}\n' : ''}${formatter.format(t.timestamp)}',
                    ),
                    trailing: t.womPin != null && t.womLink != null
                        ? SvgPicture.asset(
                            'assets/images/wom_logo.svg',
                            width: 40,
                            color: Theme.of(context).primaryColor,
                          )
                        : null,
                  );
                },
              ),
        _ => Center(
            child: CircularProgressIndicator(),
          )
      },
    );
  }
}

class _TotemMapScreen extends StatefulWidget {
  final String eventName;
  final String sessionName;
  final DateTime timestamp;
  final String totemName;
  final String providerName;
  final LatLng latLng;
  final String? womLink;
  final String? womPin;

  const _TotemMapScreen({
    required this.latLng,
    required this.totemName,
    required this.eventName,
    required this.sessionName,
    required this.timestamp,
    required this.providerName,
    this.womLink,
    this.womPin,
  });

  @override
  State<_TotemMapScreen> createState() => _TotemMapScreenState();
}

class _TotemMapScreenState extends State<_TotemMapScreen> {
  @override
  void initState() {
    super.initState();

    if (standardPin == null) {
      getPosPin().then((value) {
        standardPin = value;
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          setState(() {});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: widget.totemName,
      ),
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition:
                CameraPosition(target: widget.latLng, zoom: 14),
            markers: {
              if (standardPin != null)
                Marker(
                  markerId: MarkerId('location'),
                  position: widget.latLng,
                  icon: standardPin!,
                ),
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.womPin != null && widget.womLink != null) ...[
                    Row(
                      children: [
                        Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).secondaryHeaderColor,
                          ),
                          onPressed: () {
                            final deepLink = DeepLinkModel.fromUri(
                                Uri.parse(widget.womLink!));
                            Navigator.push(
                              context,
                              MaterialPageRoute<bool>(
                                builder: (context) => TransactionScreen(
                                  params: TransactionNotifierParams(
                                    deepLink,
                                    widget.womPin!,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            'assets/images/wom_logo.svg',
                            width: 40,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 16),
                  ],
                  Card(
                    margin: EdgeInsets.zero,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.providerName.isNotEmpty)
                            Text(
                              widget.providerName,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          Text(
                            widget.eventName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(widget.sessionName),
                          Text(formatter.format(widget.timestamp)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
