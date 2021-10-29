import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator/controllers/AdmobController.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/ui/widgets/custom_search_text.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class NamesPage extends StatefulWidget {
  @override
  _NamesPageState createState() => _NamesPageState();
}

class _NamesPageState extends State<NamesPage> {
  final hc = Get.put(HomeController());

  final ac = Get.find<AdmobController>();

  final TextEditingController nameController = TextEditingController();

  Logger logger = Logger();

  final bannerController = BannerAdController();

  @override
  void initState() {
    super.initState();
    //hc.checkReview(); //verify for review
    bannerController.load();

    bannerController.onEvent.listen((e) {
      final event = e.keys.first;
      switch (event) {
        case BannerAdEvent.loading:
          logger.i('BannerAdEvent: loading');
          break;
        case BannerAdEvent.loaded:
          logger.i('BannerAdEvent: loaded');
          break;
        case BannerAdEvent.loadFailed:
          final errorCode = e.values.first;
          logger.i('BannerAdEvent: loadFailed $errorCode');
          break;
        case BannerAdEvent.impression:
          logger.i('BannerAdEvent: ad rendered');
          break;
        default:
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final bannerAd = BannerAd(
    //     controller: bannerController,
    //     size: BannerSize.ADAPTIVE,
    //     options: BannerAdOptions(
    //       reloadWhenSizeChanges: false,
    //       reloadWhenUnitIdChanges: false,
    //     ));
    return GestureDetector(
      onTap: () {
        if (Platform.isIOS) hc.hideKeyboard(context);
      },
      child: Scaffold(
        backgroundColor: appThemeData.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                color: Colors.red,
              ),
              GetBuilder<HomeController>(
                builder: (_) => Text(hc.name,
                    style: GoogleFonts.oswald(
                        fontSize: 38, color: appThemeData.accentColor)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilder<HomeController>(
                      builder: (_) => TextButton.icon(
                            icon: Icon(Icons.copy_rounded),
                            label: Text('copy'.tr),
                            style: TextButton.styleFrom(
                              primary: appThemeData.splashColor,
                            ),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: hc.name));
                              Get.snackbar("snackbar_name_copied".tr,
                                  "snackbar_name_copied_message".tr,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: appThemeData.splashColor);
                            },
                          )),
                  GetBuilder<HomeController>(
                      builder: (_) => TextButton.icon(
                            icon: Icon(Icons.autorenew),
                            label: Text('generate_another'.tr),
                            style: TextButton.styleFrom(
                              primary: appThemeData.splashColor,
                            ),
                            onPressed: () {
                              hc.generateRandomNames(2);
                            },
                          )),
                ],
              )

              //TODO: Use svg icon

              // SizedBox(width: 0.0, height: 300),
              // bannerAd,
            ],
          ),
        ),
        // bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
