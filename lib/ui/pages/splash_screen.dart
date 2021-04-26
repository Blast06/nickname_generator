import 'package:flutter/material.dart';
import 'package:generator/controllers/SplashController.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  final sp = Get.put(SplashController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              backgroundColor: appThemeData.primaryColor,
            ),
            SizedBox(
              height: 5,
            ),
            Text('loading_txt'.tr)
          ],
        ),
      ),
    );
  }
}