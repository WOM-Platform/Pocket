import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/core/application/transaction_notifier.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/database/database.dart';
import 'package:wom_pocket/src/features/totem/application/totem_scans_notifier.dart';
import 'package:wom_pocket/src/models/deep_link_model.dart';
import 'package:wom_pocket/src/screens/pos_list/pos_map_notifier.dart';
import 'package:wom_pocket/src/screens/transaction/transaction_screen.dart';
import 'package:wom_pocket/src/utils/date_utils.dart';
import 'package:wom_pocket/src/utils/utils.dart';
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
      },
    );
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
        '${t.eventName ?? 'Evento'}${t.sessionName != null ? ' | ${t.sessionName}' : ''}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final TotemRow t;

  const _Item({required this.t});

  @override
  Widget build(BuildContext context) {
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
                    email: t.email,
                    url: t.url,
                    phoneNumber: t.phoneNumber,
                  ),
                ),
              );
            }
          : null,
      title: Text(t.totemName ?? 'Totem'),
      subtitle: Text(
        t.timestamp.format(context.locale.languageCode),
      ),
      trailing: t.womPin != null && t.womLink != null
          ? SvgPicture.asset(
              'assets/images/wom_logo.svg',
              width: 40,
              color: Theme.of(context).primaryColor,
            )
          : null,
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
  final String? email;
  final String? phoneNumber;
  final String? url;

  const _TotemMapScreen({
    required this.latLng,
    required this.totemName,
    required this.eventName,
    required this.sessionName,
    required this.timestamp,
    required this.providerName,
    this.womLink,
    this.womPin,
    this.email,
    this.phoneNumber,
    this.url,
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
        // actions: [
        //   if (widget.email != null)
        //     IconButton(
        //         icon: Icon(Icons.email),
        //         color: Colors.white,
        //         onPressed: () async {
        //           final Uri emailLaunchUri = Uri(
        //             scheme: 'mailto',
        //             path: widget.email!,
        //           );
        //           Utils.launchUri(emailLaunchUri);
        //         }),
        //   if (widget.phoneNumber != null)
        //     IconButton(
        //       icon: Icon(Icons.contact_page),
        //       color: Colors.white,
        //       onPressed: () async {
        //         final Uri emailLaunchUri = Uri(
        //           scheme: 'tel',
        //           path: widget.phoneNumber!,
        //         );
        //
        //         Utils.launchUri(emailLaunchUri);
        //       },
        //     ),
        //   if (widget.url != null)
        //     IconButton(
        //         icon: Icon(Icons.open_in_browser),
        //         color: Colors.white,
        //         onPressed: () async {
        //           Utils.launchURL(widget.url!);
        //         }),
        // ],
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
                                Uri.parse(widget.womLink!),);
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(widget.timestamp
                              .format(context.locale.languageCode),),
                          if ((widget.email != null &&
                                  widget.email!.isNotEmpty) ||
                              (widget.phoneNumber != null &&
                                  widget.phoneNumber!.isNotEmpty) ||
                              (widget.url != null &&
                                  widget.url!.isNotEmpty)) ...[
                            Divider(),
                            Text(
                              'totem_scan_screen.contact_info'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            if (widget.email != null &&
                                widget.email!.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  final Uri emailLaunchUri = Uri(
                                    scheme: 'mailto',
                                    path: widget.email!,
                                  );
                                  Utils.launchUri(emailLaunchUri);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.email),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.email!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            if (widget.phoneNumber != null &&
                                widget.phoneNumber!.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  final Uri emailLaunchUri = Uri(
                                    scheme: 'tel',
                                    path: widget.phoneNumber!,
                                  );

                                  Utils.launchUri(emailLaunchUri);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.phoneNumber!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            if (widget.url != null &&
                                widget.url!.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              InkWell(
                                onTap: () {
                                  Utils.launchURL(widget.url!);
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.open_in_browser),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.url!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
