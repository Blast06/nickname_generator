import 'package:flutter/material.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/ui/pages/about_page.dart';
import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/symbols_page.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final gc = Get.put(HomeController());
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
              icon: const Icon(Icons.info),
              title: Text('bottom_bar_symbols'.tr,
                  style: TextStyle(color: appThemeData.highlightColor)),
            ),
            CustomNavigationBarItem(
              icon: const Icon(Icons.info),
              title: Text(
                'bottom_bar_about'.tr,
                style: TextStyle(color: appThemeData.highlightColor),
              ),
            ),
          ],
          currentIndex: gc.currentIndex,
          onTap: (index) {
            gc.changeCurrentIndex(index);
            switch (index) {
              case 0:
                Get.off( () => HomePage(), transition: Transition.cupertino);
                break;
              case 1: 
                Get.off( () => SymbolsPage(), transition: Transition.cupertino);
                break;
              case 2: 
                Get.off( () => AboutPage(), transition: Transition.cupertino);
                break;
              default: 
                Get.off( () => HomePage(), transition: Transition.zoom);
                break;
            }
          }),
    );
  }
}