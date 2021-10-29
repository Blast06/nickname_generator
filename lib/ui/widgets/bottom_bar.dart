import 'package:flutter/material.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/routes/app_pages.dart';
import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/privacy_policy.dart';
import 'package:generator/ui/pages/symbols_list_page.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:logger/logger.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final gc = Get.put(HomeController());
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
    return GetBuilder<HomeController>(
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
          currentIndex: gc.currentIndex,
          onTap: (index) {
            gc.changeCurrentIndex(index);
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
