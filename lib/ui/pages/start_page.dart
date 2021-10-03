import 'package:flutter/material.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/privacy_policy.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  final hc = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('text')),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('start_text'.tr,
              style: GoogleFonts.oswald(
                  fontSize: 38, fontWeight: FontWeight.w500)),
          Text('Names generator', style: GoogleFonts.oswald(fontSize: 14)),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.off(PrivacyPolicy());
                },
                child: Container(
                  height: 60,
                  width: 50,
                  color: appThemeData.accentColor,
                  child: Icon(Icons.privacy_tip),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 60,
                  width: 50,
                  color: appThemeData.accentColor,
                  child: Icon(Icons.share_outlined),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 60,
                width: 50,
                color: appThemeData.accentColor,
                child: Icon(Icons.rate_review_outlined),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: appThemeData.backgroundColor,
              child: TextButton(
                onPressed: () {
                  Get.off(() => HomePage(), transition: Transition.downToUp);
                },
                child: Text(
                  'START',
                  style: TextStyle(
                      color: appThemeData.splashColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    )
        // bottomNavigationBar: BottomBar(),
        );
  }
}
