import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wom_pocket/src/core/constants.dart';
import 'package:wom_pocket/src/core/models/totem_data.dart';
import 'package:wom_pocket/src/core/my_logger.dart';
import 'package:wom_pocket/src/core/routing/route_extensions.dart';
import 'package:wom_pocket/src/core/ui/widgets/my_button.dart';
import 'package:wom_pocket/src/core/utils/colors.dart';
import 'package:wom_pocket/src/core/utils/utils.dart';
import 'package:wom_pocket/src/features/new_home/application/wom_stats_notifier.dart';
import 'package:wom_pocket/src/features/root/widgets/totem_dialog.dart';
import 'package:wom_pocket/src/features/totem/utils.dart';

class IntroScreen extends HookConsumerWidget {
  final bool fromSettings;
  final TextStyle whiteTextStyle = TextStyle(color: Colors.white);
  final TextStyle descStyle = TextStyle(color: Colors.white);

  IntroScreen({this.fromSettings = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionCount = ref.watch(transactionCountProvider).value ?? 0;
    final selectedPage = useState(0);
    final gender = useState<Gender?>(null);
    final locationPermission = useState<PermissionStatus>(
      PermissionStatus.denied,
    );

    useOnAppLifecycleStateChange((previous, current) async {
      if (current == AppLifecycleState.resumed) {
        locationPermission.value = await Permission.location.status;
      }
    });

    useEffect(() {
      Future.microtask(() async {
        locationPermission.value = await Permission.location.status;
        final genderString = await Hive.box('settings').get('gender');
        if (genderString != null) {
          try {
            gender.value = Gender.values.byName(genderString);
          } catch (e, st) {
            logger.e(
              'IntroScreen: error retrieving gender from hive',
              error: e,
              stackTrace: st,
            );
          }
        }
      });
      return null;
    }, []);

    final pages = [
      IntroPage(
        textColor: Colors.white,
        backGroundColor: darkBackground,
        message: 'introDesc1'.tr(),
        title: 'introTitle1'.tr(),
        child: Container(
          width: MediaQuery.of(context).size.width - 48,
          height: MediaQuery.of(context).size.width - 48,
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/images/wom-pocket-icon.svg',
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: darkBackground,
        message: 'introDesc2'.tr(),
        title: 'introTitle2'.tr(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: SvgPicture.asset(
            'assets/images/wom-icon-brand.svg',
            height: 260.0,
            width: 260.0,
            // alignment: Alignment.topCenter,
          ),
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: darkBackground,
        message: 'introDesc3'.tr(),
        title: 'introTitle3'.tr(),
        child: Image.asset(
          IMAGE_PATH_INTRO_1,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: darkBackground,
        message: 'introDesc4'.tr(),
        title: 'introTitle4'.tr(),
        child: Image.asset(
          IMAGE_PATH_INTRO_2,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: darkBackground,
        message: 'introDesc5'.tr(),
        title: 'introTitle5'.tr(),
        child: Image.asset(
          IMAGE_PATH_INTRO_3,
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        ),
      ),
      IntroPage(
        textColor: Colors.white,
        backGroundColor: darkBackground,
        message: 'introDesc6'.tr(),
        title: 'introTitle6'.tr(),
        child: Icon(Icons.warning, color: Colors.white, size: 200),
      ),
      if (!fromSettings) ...[
        IntroPage(
          textColor: Colors.white,
          backGroundColor: darkBackground,
          message: locationPermission.value.isGranted
              ? 'introDescGPSGranted'.tr()
              : 'introDescGPS'.tr(),
          title: 'introTitleGPS'.tr(),
          child: Icon(Icons.gps_fixed, color: Colors.white, size: 200),
          bottomButton: locationPermission.value.isGranted
              ? null
              : MyButton(
                  backgroundColor: accentColor,
                  onPressed: () async {
                    final status = await Permission.location.request();
                    locationPermission.value = status;
                  },
                  child: Text(
                    'grantPermission'.tr(),
                    style: TextStyle(color: primaryColor),
                  ),
                ),
        ),
        IntroPage(
          textColor: Colors.white,
          backGroundColor: darkBackground,
          message: 'genderSelectionDescription'.tr(),
          title: 'genderSelectionTitle'.tr(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'introSelectGender'.tr(),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              const SizedBox(height: 16),
              for (int i = 0; i < Gender.values.length; i++)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: MyButton(
                    backgroundColor: gender.value == Gender.values[i]
                        ? accentColor
                        : Colors.white,
                    onPressed: () async {
                      gender.value = Gender.values[i];
                      await Hive.box(
                        'settings',
                      ).put('gender', gender.value!.name);
                    },
                    child: Text(
                      Gender.values[i].translate(context),
                      style: TextStyle(
                        color: gender.value == Gender.values[i]
                            ? primaryColor
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
      if (transactionCount == 0)
        IntroPage(
          textColor: Colors.white,
          backGroundColor: darkBackground,
          message: 'introDesc7'.tr(),
          title: 'introTitle7'.tr(),
          bottomButton: MyButton(
            backgroundColor: accentColor,
            onPressed: () {
              final totemData = validateTotemQrCodeWithRegex(welcomeTotem);
              if (totemData != null) {
                launchTotemDialog(context, totemData);
              }
            },
            child: Text(
              'introAction7'.tr(),
              style: TextStyle(color: primaryColor),
            ),
          ),
          child: SvgPicture.asset(
            'assets/images/wom-icon-brand.svg',
            height: 285.0,
            width: 285.0,
            // alignment: Alignment.topCenter,
          ),
        ),
    ];

    return Stack(
      children: [
        Positioned.fill(
          child: PageView(
            children: pages,
            onPageChanged: (page) {
              selectedPage.value = page;
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 80,
            child: Consumer(
              builder: (context, ref, child) {
                return DotsIndicator(
                  decorator: DotsDecorator(
                    color: lightBlue,
                    activeColor: Colors.yellow,
                  ),
                  position: min(
                    selectedPage.value.toDouble(),
                    pages.length - 1,
                  ),
                  dotsCount: pages.length,
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 16,
          child: SizedBox(
            height: 80,
            child: min(selectedPage.value, pages.length - 1) == pages.length - 1
                ? TextButton(
                    onPressed: () {
                      Utils.setIsFirstOpen(false);
                      context.maybePop();
                      if (fromSettings) {
                        context.maybePop();
                      } else {
                        context.go('/');
                      }
                    },
                    child: Text(
                      'done'.tr(),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

class IntroPage extends StatelessWidget {
  final String title;
  final Color? backGroundColor;
  final String message;
  final Widget child;
  final Color? textColor;
  final Widget? bottomButton;

  const IntroPage({
    required this.backGroundColor,
    required this.title,
    required this.message,
    required this.child,
    Key? key,
    this.textColor,
    this.bottomButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: backGroundColor ?? Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    color: textColor ?? secondaryColor,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(flex: 2, child: child),
            Expanded(
              flex: 1,
              child: Center(
                child: AutoSizeText(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            if (bottomButton != null) bottomButton!,
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
