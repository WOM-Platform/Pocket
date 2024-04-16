import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wom_pocket/src/utils/colors.dart';

class PocketAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const PocketAppBar({Key? key, this.actions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      actions: actions,
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
            height: kToolbarHeight - 8,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
