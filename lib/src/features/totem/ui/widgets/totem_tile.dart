import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_appbar.dart';
import 'package:wom_pocket/src/core/database/database.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/totem/application/totem_scans_notifier.dart';
import 'package:wom_pocket/src/core/utils/date_utils.dart';
import 'package:wom_pocket/src/features/totem/ui/totem_details.dart';


class TotemTile extends StatelessWidget {
  final TotemRow t;

  const TotemTile({required this.t});

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
        context.push('/totem/map', extra: data);
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