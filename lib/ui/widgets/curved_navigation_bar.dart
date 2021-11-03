import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:generator/controllers/GlobalController.dart';
import '/ui/pages/home_page.dart';
import '/ui/pages/privacy_policy.dart';
import '/ui/pages/symbols_list_page.dart';
import 'package:logger/logger.dart';
import '/controllers/HomeController.dart';
import 'package:get/get.dart';

class CurvedNavigationBar extends StatefulWidget {
  const CurvedNavigationBar({Key key}) : super(key: key);

  @override
  State<CurvedNavigationBar> createState() => _CurvedNavigationBarState();
}

class _CurvedNavigationBarState extends State<CurvedNavigationBar> {
  final gc = Get.find<GlobalController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      builder: (_) {
        return ConvexAppBar(
          items: [
            TabItem(icon: Icons.home, title: 'bottom_bar_home'.tr),
            TabItem(icon: Icons.ac_unit, title: 'bottom_bar_symbols'.tr),
            TabItem(icon: Icons.info, title: 'bottom_bar_privacy'.tr),
          ],
          initialActiveIndex: _.currentIndex, //optional, default as 0
          onTap: _.changeCurrentIndex,
        );
      },
    );
  }
}
