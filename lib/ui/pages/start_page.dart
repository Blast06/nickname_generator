import 'package:flutter/material.dart';
import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text('text')),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ROBLOX', style: GoogleFonts.oswald(fontSize: 38)),
          Text('Names generator', style: GoogleFonts.oswald(fontSize: 14)),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                width: 50,
                color: Colors.grey,
                child: Icon(Icons.privacy_tip),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 60,
                width: 50,
                color: Colors.grey,
                child: Icon(Icons.share_outlined),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 60,
                width: 50,
                color: Colors.grey,
                child: Icon(Icons.rate_review_sharp),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: appThemeData.highlightColor,
              child: TextButton(
                onPressed: () {
                  Get.off(HomePage(), transition: Transition.zoom);
                },
                child: Text(
                  'START',
                  style: TextStyle(color: Colors.black),
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
