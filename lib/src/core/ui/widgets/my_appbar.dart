import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';

class PocketAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const PocketAppBar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        ...?actions,
        IconButton(
          onPressed: () {
            context.push('/settings');
          },
          icon: Icon(Icons.settings),
          color: primaryColor,
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: primaryColor, // Navigation bar
        statusBarColor: Colors.white, // Status bar
        statusBarIconBrightness: Brightness.dark,
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/images/wom-pocket-icon.svg',
            // width: 200,
            height: kToolbarHeight / 2,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class SecondLevelAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final String title;
  final PreferredSizeWidget? bottom;

  const SecondLevelAppBar({
    required this.title,
    super.key,
    this.actions,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      actions: [
        if (actions != null && actions!.isNotEmpty) ...[
          ...actions!,
          const SizedBox(width: 8),
        ],
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottom != null ? kToolbarHeight * 2 : kToolbarHeight);
}
