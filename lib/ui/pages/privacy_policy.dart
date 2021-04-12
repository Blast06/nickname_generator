import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:generator/controllers/AboutController.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:get/get.dart';

class PrivacyPolicy extends StatelessWidget {
  final controller = Get.put(AboutController());
  // final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AboutController>(
        builder: (_) => Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 140),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: MarkdownBody(data: _.description),
                  ),
                ),
              ),
            ),
            // headerWidget(
            //     context, appThemeData.primaryColor, _drawerKey, 'About')
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}