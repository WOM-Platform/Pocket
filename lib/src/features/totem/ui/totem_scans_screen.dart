import 'dart:convert';
import 'dart:io';

import 'package:contacts_service/contacts_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/features/totem/application/totem_scans_notifier.dart';
import 'package:wom_pocket/src/core/utils/date_utils.dart';
import 'package:wom_pocket/src/features/totem/ui/totem_details.dart';

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
                  Text('Camera'),
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
                  Text('Galleria'),
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
                    Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 16),
                    Text('Rimuvoi l\'immagine corrente'),
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
    final state = ref.watch(getScannedTotemsProvider);
    return Scaffold(
      appBar: SecondLevelAppBar(
        title: 'connections'.tr(),
        actions: [
          IconButton(onPressed: (){
            context.go('/totem/account');
          }, icon: Icon(Icons.account_circle),),
          const SizedBox(width: 8),
        ],
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

  const _Item({super.key, required this.t});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        backgroundImage:
            t.image != null ? MemoryImage(base64.decode(t.image!)) : null,
        child: t.image != null
            ? null
            : Text(
                t.totemName?[0] ?? '',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
      ),
      onTap: () {
        final latLng = t.latitude != null && t.longitude != null
            ? LatLng(t.latitude!, t.longitude!)
            : null;

        final data = TotemMapData(
          latLng: latLng,
          totemId: t.totemId,
          totemName: t.totemName ?? 'Totem',
          eventName: t.eventName ?? 'Evento',
          sessionName: t.sessionName,
          timestamp: t.timestamp,
          womLink: t.womLink,
          womPin: t.womPin,
          providerName: t.providerName ?? '',
          email: t.email,
          url: t.url,
          phoneNumber: t.phoneNumber,
          base64Image: t.image,
          notes: t.notes,
        );
        context.push('/settings/totem-scans/map', extra: data);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => TotemMapScreen(
        //       data: data,
        //     ),
        //   ),
        // );
      },
      title: Text(t.totemName ?? 'Totem'),
      subtitle: Text(
        t.timestamp.format(context.locale.languageCode),
      ),
      trailing: t.womPin != null && t.womLink != null
          ? SvgPicture.asset(
              'assets/images/wom_logo.svg',
              width: 40,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            )
          : null,
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
