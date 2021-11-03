import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generator/controllers/GlobalController.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/routes/app_pages.dart';
import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/privacy_policy.dart';
import 'package:generator/ui/pages/symbols_list_page.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:logger/logger.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Logger logger = Logger();
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      builder: (_) => CustomNavigationBar(
          iconSize: 30,
          selectedColor: Colors.white,
          strokeColor: appThemeData.highlightColor,
          unSelectedColor: appThemeData.highlightColor,
          backgroundColor: appThemeData.primaryColor,
          items: [
            CustomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: Text('bottom_bar_home'.tr,
                  style: TextStyle(color: appThemeData.highlightColor)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.ac_unit),
              title: Text('bottom_bar_symbols'.tr,
                  style: TextStyle(color: appThemeData.highlightColor)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.info),
              title: Text(
                'bottom_bar_privacy'.tr,
                style: TextStyle(color: appThemeData.highlightColor),
              ),
            ),
          ],
          currentIndex: _.currentIndex,
          onTap: (index) {
            _.changeCurrentIndex(index);
            switch (index) {
              case 0:
                Get.off(() => HomePage(), transition: Transition.cupertino);
                // Navigator.pushNamed(context, Routes.HOME_PAGE);
                logger.v("INDEX => $index");
                break;
              case 1:
                Get.off(() => SymbolsListPage(),
                    transition: Transition.cupertino);
                // Navigator.pushNamed(context, Routes.SYMBOLS_PAGE);
                logger.v("INDEX => $index");

                break;
              case 2:
                Get.off(() => PrivacyPolicy(),
                    transition: Transition.cupertino);
                // Navigator.pushNamed(context, Routes.PRIVACY_POLITICS);
                logger.v("INDEX => $index");

                break;
              default:
                Get.off(() => HomePage(), transition: Transition.zoom);
                // Navigator.pushNamed(context, Routes.HOME_PAGE);
                logger.v("INDEX => $index");

                break;
            }
          }),
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ("Settings"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
