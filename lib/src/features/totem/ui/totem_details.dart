import 'dart:convert';
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wom_pocket/src/core/application/aim_notifier.dart';
import 'package:wom_pocket/src/core/models/deep_link_model.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/utils/date_utils.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/totem/ui/connections_screen.dart';
import 'package:wom_pocket/src/features/transaction/application/transaction_notifier.dart';

class TotemMapData {
  final String totemId;
  final String eventName;
  final String? sessionName;
  final DateTime timestamp;
  final String totemName;
  final String providerName;
  final LatLng? latLng;
  final String? womLink;
  final String? womPin;
  final String? email;
  final String? phoneNumber;
  final String? url;
  final String? base64Image;
  final String? notes;

  TotemMapData({
    required this.totemId,
    required this.eventName,
    required this.sessionName,
    required this.timestamp,
    required this.totemName,
    required this.providerName,
    required this.latLng,
    required this.womLink,
    required this.womPin,
    required this.email,
    required this.phoneNumber,
    required this.url,
    required this.base64Image,
    required this.notes,
  });
}

class TotemMapScreen extends ConsumerStatefulWidget {
  String get totemId => data.totemId;

  String get eventName => data.eventName;

  String? get sessionName => data.sessionName;

  DateTime get timestamp => data.timestamp;

  String get totemName => data.totemName;

  String get providerName => data.providerName;

  LatLng? get latLng => data.latLng;

  String? get womLink => data.womLink;

  String? get womPin => data.womPin;

  String? get email => data.email;

  String? get phoneNumber => data.phoneNumber;

  String? get url => data.url;

  String? get base64Image => data.base64Image;

  String? get notes => data.notes;

  static const platform = MethodChannel('social.wom.pocket/contact');

  final TotemMapData data;

  const TotemMapScreen({required this.data});

  @override
  ConsumerState<TotemMapScreen> createState() => _TotemMapScreenState();
}

class _TotemMapScreenState extends ConsumerState<TotemMapScreen> {
  Uint8List? imageBytes;
  bool isLoadingImage = false;

  @override
  void initState() {
    super.initState();

    if (widget.base64Image != null) {
      imageBytes = base64.decode(widget.base64Image!);
    }
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
    final labelStyle = TextStyle(color: Colors.grey, fontSize: 12);
    final valueStyle = Theme.of(context).textTheme.titleMedium;
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: widget.totemName,
        actions: [
          IconButton(
            icon: Icon(Icons.contact_page_sharp),
            color: Colors.white,
            onPressed: () async {
              if (Platform.isAndroid) {
                final url = widget.url != null
                    ? checkIfUrlContainPrefixHttp(widget.url!)
                    : null;
                final intent = AndroidIntent(
                  action: 'android.intent.action.INSERT',
                  type: 'vnd.android.cursor.dir/contact',
                  // type: 'ContactsContract.Contacts.CONTENT_URI',
                  // data: 'package:social.wom.pocket',
                  arguments: {
                    'name': widget.totemName,
                    if (widget.phoneNumber != null) 'phone': widget.phoneNumber,
                    if (widget.email != null) 'email': widget.email,
                    if (url != null) 'URL': url,
                    'finishActivityOnSaveCompleted': true,
                  },
                );
                intent.launch();
              } else if (Platform.isIOS) {
                try {
                  final result = await TotemMapScreen.platform
                      .invokeMethod<int>('creatNewContact', {
                        'email': widget.email,
                        'name': widget.totemName,
                        'phone': widget.phoneNumber,
                        'url': widget.url,
                      });
                } on PlatformException catch (e) {
                  logger.e(e);
                }
              }
            },
          ),
          GestureDetector(
            onTap: () {
              getWom();
            },
            child: SvgPicture.asset(
              'assets/images/wom-icon-brand.svg',
              width: 40,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 16),
        ],
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: GestureDetector(
              onTap: () async {
                final res = await showModalBottomSheet(
                  context: context,
                  builder: (_) => SelectPictureModal(
                    onRemove: imageBytes != null
                        ? () {
                            ref
                                .read(getDatabaseProvider)
                                .totemsDao
                                .removeImage(widget.totemId);
                            setState(() {
                              imageBytes = null;
                            });
                          }
                        : null,
                  ),
                );

                if (res != null) {
                  final ImagePicker picker = ImagePicker();
                  final image = await picker.pickImage(
                    source: res ? ImageSource.gallery : ImageSource.camera,
                    maxHeight: 512,
                    maxWidth: 512,
                  );

                  if (image != null) {
                    setState(() {
                      isLoadingImage = true;
                    });

                    final originalImageBytes = await image.readAsBytes();

                    final imageBytes = await context.push<Uint8List?>(
                      '/totem/image-crop',
                      extra: originalImageBytes,
                    );

                    if (imageBytes != null) {
                      try {
                        final base64Image = base64.encode(imageBytes);
                        await ref
                            .read(getDatabaseProvider)
                            .totemsDao
                            .updateTotemWithImagePath(
                              widget.totemId,
                              base64Image,
                            );
                        setState(() {
                          isLoadingImage = false;
                          this.imageBytes = imageBytes;
                        });
                      } catch (ex, st) {
                        setState(() {
                          isLoadingImage = false;
                        });
                        logger.e(
                          'get image for totem',
                          error: ex,
                          stackTrace: st,
                        );
                      }
                    } else {
                      setState(() {
                        isLoadingImage = false;
                      });
                    }
                  }
                }
              },
              child: SizedBox(
                height: 120,
                width: 120,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: imageBytes != null && !isLoadingImage
                      ? MemoryImage(imageBytes!)
                      : null,
                  child: isLoadingImage
                      ? CircularProgressIndicator()
                      : imageBytes == null
                      ? Icon(Icons.camera_alt, color: Colors.white)
                      : null,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.totemName,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Divider(),
          if (widget.providerName.isNotEmpty) ...[
            Text('totem_scan_screen.provider'.tr(), style: labelStyle),
            Text(widget.providerName, style: valueStyle),
            const SizedBox(height: 8),
          ],
          Text('totem_scan_screen.event'.tr(), style: labelStyle),
          Text(widget.eventName, style: Theme.of(context).textTheme.titleLarge),
          if (!widget.sessionName.isNullOrEmpty) ...[Text(widget.sessionName!)],
          Text(widget.timestamp.format(context.locale.languageCode)),
          if (widget.email != null && widget.email!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text('Email', style: labelStyle),
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
                  // Icon(Icons.email),
                  // const SizedBox(width: 4),
                  Text(widget.email!, style: valueStyle),
                ],
              ),
            ),
          ],
          if (widget.phoneNumber != null && widget.phoneNumber!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text('totem_scan_screen.phone'.tr(), style: labelStyle),
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
                  // Icon(Icons.phone),
                  // const SizedBox(width: 4),
                  Text(widget.phoneNumber!, style: valueStyle),
                ],
              ),
            ),
          ],
          if (widget.url != null && widget.url!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text('totem_scan_screen.website'.tr(), style: labelStyle),
            InkWell(
              onTap: () {
                Utils.launchURL(widget.url!);
              },
              child: Row(
                children: [
                  // Icon(Icons.open_in_browser),
                  // const SizedBox(width: 4),
                  Text(widget.url!, style: valueStyle),
                ],
              ),
            ),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              Text('totem_scan_screen.notes'.tr(), style: labelStyle),
              const SizedBox(width: 4),
              Icon(Icons.edit, color: Colors.grey, size: 10),
            ],
          ),
          InlineEditableText(
            text: widget.notes,
            hint: 'totem_scan_screen.tap_here_to_change'.tr(),
            style: valueStyle,
            emptyStyle: valueStyle?.copyWith(color: Colors.grey),
            onSubmitted: (notes) {
              ref
                  .read(getDatabaseProvider)
                  .totemsDao
                  .updateNotes(widget.totemId, notes);
            },
          ),
          if (widget.womPin != null && widget.womLink != null) ...[
            const SizedBox(height: 16),
            // Center(
            //   child: MyButton(
            //     onPressed: () {
            //       getWom();
            //     },
            //     child: Row(
            //       mainAxisSize: MainAxisSize.min,
            //       children: [
            //         Text('Riscatta'),
            //         const SizedBox(width: 8),
            //         SvgPicture.asset(
            //           'assets/images/wom_logo.svg',
            //           width: 40,
            //           colorFilter: ColorFilter.mode(
            //             Colors.white,
            //             BlendMode.srcIn,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 16),
          ],
          if (widget.latLng != null)
            SizedBox(
              height: 300,
              child: GoogleMap(
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: widget.latLng!,
                  zoom: 16,
                ),
                markers: {
                  if (standardPin != null)
                    Marker(
                      markerId: MarkerId('location'),
                      position: widget.latLng!,
                      icon: standardPin!,
                    ),
                },
              ),
            ),
        ],
      ),
    );
  }

  getWom() {
    final deepLink = DeepLinkModel.fromUri(Uri.parse(widget.womLink!));
    context.push(
      '/transaction',
      extra: TransactionNotifierParams(deepLink, widget.womPin!),
    );
    // Navigator.push(
    //   context,
    //   MaterialPageRoute<bool>(
    //     builder: (context) => TransactionScreen(
    //       params: TransactionNotifierParams(
    //         deepLink,
    //         widget.womPin!,
    //       ),
    //     ),
    //   ),
    // );
  }
}

String checkIfUrlContainPrefixHttp(String url) {
  if (url.startsWith('http://') || url.startsWith('https://')) {
    return url;
  } else {
    return 'https://' + url;
  }
}
