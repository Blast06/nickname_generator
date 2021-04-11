import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator/controllers/AdmobController.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/ui/widgets/custom_search_text.dart';
import 'package:generator/utils/MyAdmob.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class SymbolsPage extends StatefulWidget {
  @override
  _SymbolsPageState createState() => _SymbolsPageState();
}

class _SymbolsPageState extends State<SymbolsPage> {
  final hc = Get.put(HomeController());

  final ac = Get.find<AdmobController>();

  final TextEditingController nameController = TextEditingController();

  Logger logger = Logger();

  // final bannerController = BannerAdController();

  @override
  void initState() {
    super.initState();
    // bannerController.load();

    // bannerController.onEvent.listen((e) {
    //   final event = e.keys.first;
    //   switch (event) {
    //     case BannerAdEvent.loading:
    //       logger.i('BannerAdEvent: loading');
    //       break;
    //     case BannerAdEvent.loaded:
    //       logger.i('BannerAdEvent: loaded');
    //       break;
    //     case BannerAdEvent.loadFailed:
    //       final errorCode = e.values.first;
    //       logger.i('BannerAdEvent: loadFailed $errorCode');
    //       break;
    //     case BannerAdEvent.impression:
    //       logger.i('BannerAdEvent: ad rendered');
    //       break;
    //     default:
    //       break;
    //   }
    // });
  }

  @override
  void dispose() {
    super.dispose();
    // bannerController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final bannerAd = BannerAd(
        // controller: bannerController,
        size: BannerSize.ADAPTIVE,
        options: BannerAdOptions(
          reloadWhenSizeChanges: false,
          reloadWhenUnitIdChanges: false,
        ));
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        title: Text('name'),
        backgroundColor: appThemeData.primaryColor,
      ),
      body: GetBuilder<HomeController>(builder: (_)  => Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, left: 18, right: 18),
            child: CustomSearchText(
                text: hc.nickName,
                enable: true,
                callback: () {
                  nameController.text = hc.nickName;
                  TextSelection.fromPosition(
                    TextPosition(offset: nameController.text.length),
                  );
                  // TODO: Fix bug when generating new nickname and does not change in textbox if focus is on
                },
                controller: nameController,
                callback2: (text) {
                  TextSelection previousSelection = nameController.selection;
                  // HERE IS WHERE IT CHANGES when a text in gridview is pressed
                  nameController.selection = previousSelection;
                  logger.v("${nameController.selection.start}");
                  _.changeNickName(text);
                },
              ),
            
          ),

          //TODO: Use svg icon
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IconButton(
                //   icon: Icon(Icons.restore_sharp),
                //   onPressed: () {
                //     hc.generateRandomNickName();
                //     FocusScope.of(context).unfocus();
                //     SystemChannels.textInput.invokeMethod('TextInput.hide');
                //   },
                // ),
                // IconButton(
                //   icon: Icon(Icons.share_rounded),
                //   onPressed: () => hc
                //       .generateRandomNickName(), //TODO: Add share nickname feature
                // ),
                // IconButton(
                //     icon: Icon(Icons.copy_rounded),
                //     onPressed: () {
                //       Clipboard.setData(ClipboardData(text: hc.nickName));
                //       Get.snackbar("snackbar_download_title".tr,
                //           "snackbar_download_message".tr,
                //           snackPosition: SnackPosition.BOTTOM,
                //           backgroundColor: appThemeData.accentColor);
                //       // nameController.selection = TextSelection.fromPosition(TextPosition(offset: nameController.text.length));
                //     }),
                FlatButton.icon(
                  icon: Icon(Icons.copy_rounded),
                  label: Text('copy'.tr),
                  color: appThemeData.accentColor,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: hc.nickName));
                    Get.snackbar("snackbar_download_title".tr,
                        "snackbar_download_message".tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: appThemeData.accentColor);
                  },
                )
              ],
            ),
          
          const SizedBox(
            height: 10,
          ),
          //  Container(
          //   alignment: Alignment.topLeft,
          //   margin: EdgeInsets.only(left: 8, bottom: 4),
          //   child: Text('symbols'.tr, style: TextStyle(fontSize: 20)),
          // ),
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 4,
                  ),
                  itemCount: symbols2.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () {
                        // hc.inputText(symbols2[index].symbol,
                        // nameController.selection.start);
                        Get.snackbar("snackbar_download_title2".tr,
                            "snackbar_download_message".tr,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: appThemeData.accentColor);
                        print("nameController.selection.start");
                        Clipboard.setData(
                            ClipboardData(text: symbols2[index].symbol));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(symbols2[index].symbol),
                        decoration: BoxDecoration(
                            color: appThemeData.accentColor,
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    );
                  }),
            ),
          

          // Container(
          //   alignment: Alignment.topLeft,
          //   margin: EdgeInsets.only(left: 8, bottom: 4, top: 5),
          //   child: Text('Emojis', style: TextStyle(fontSize: 20)),
          // ),
          // Expanded(
          //   child: GridView.builder(
          //       padding: EdgeInsets.only(left: 8, right: 8),
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         childAspectRatio: 3 / 2,
          //         crossAxisSpacing: 20,
          //         mainAxisSpacing: 20,
          //         crossAxisCount: 4,
          //       ),
          //       itemCount: emojis.length,
          //       itemBuilder: (BuildContext ctx, index) {
          //         return GestureDetector(
          //           onTap: () {
          //             // hc.inputText(symbols2[index].symbol,
          //             // nameController.selection.start);
          //             Get.snackbar("snackbar_download_title2".tr,
          //                 "snackbar_download_message".tr,
          //                 snackPosition: SnackPosition.BOTTOM,
          //                 backgroundColor: appThemeData.accentColor);
          //             print("nameController.selection.start");
          //             Clipboard.setData(
          //                 ClipboardData(text: emojis[index].symbol));
          //           },
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(emojis[index].symbol),
          //             decoration: BoxDecoration(
          //                 color: appThemeData.accentColor,
          //                 borderRadius: BorderRadius.circular(15)),
          //           ),
          //         );
          //       }),
          // ),
          //
          // Container(
          //   alignment: Alignment.topLeft,
          //   margin: EdgeInsets.only(left: 8, bottom: 4),
          //   child: Text('numbers', style: TextStyle(fontSize: 20)),
          // ),
          // Expanded(
          //   child: GridView.builder(
          //       padding: EdgeInsets.only(left: 8, right: 8),
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         childAspectRatio: 3 / 2,
          //         crossAxisSpacing: 20,
          //         mainAxisSpacing: 20,
          //         crossAxisCount: 4,
          //       ),
          //       itemCount: numbers.length,
          //       itemBuilder: (BuildContext ctx, index) {
          //         return GestureDetector(
          //           onTap: () {
          //             // hc.inputText(symbols2[index].symbol,
          //             // nameController.selection.start);
          //             Get.snackbar("snackbar_download_title2".tr,
          //                 "snackbar_download_message".tr,
          //                 snackPosition: SnackPosition.BOTTOM,
          //                 backgroundColor: appThemeData.accentColor);
          //             print("nameController.selection.start");
          //             Clipboard.setData(
          //                 ClipboardData(text: numbers[index].symbol));
          //           },
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(numbers[index].symbol),
          //             decoration: BoxDecoration(
          //                 color: appThemeData.accentColor,
          //                 borderRadius: BorderRadius.circular(15)),
          //           ),
          //         );
          //       }),
          // ),
          // Container(
          //   alignment: Alignment.topLeft,
          //   margin: EdgeInsets.only(left: 8, bottom: 4),
          //   child: Text('alphabet', style: TextStyle(fontSize: 20)),
          // ),
          // Expanded(
          //   child: GridView.builder(
          //       padding: EdgeInsets.only(left: 8, right: 8),
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         childAspectRatio: 3 / 2,
          //         crossAxisSpacing: 20,
          //         mainAxisSpacing: 20,
          //         crossAxisCount: 4,
          //       ),
          //       itemCount: alphabet.length,
          //       itemBuilder: (BuildContext ctx, index) {
          //         return GestureDetector(
          //           onTap: () {
          //             // hc.inputText(symbols2[index].symbol,
          //             // nameController.selection.start);
          //             Get.snackbar("snackbar_download_title2".tr,
          //                 "snackbar_download_message".tr,
          //                 snackPosition: SnackPosition.BOTTOM,
          //                 backgroundColor: appThemeData.accentColor);
          //             print("nameController.selection.start");
          //             Clipboard.setData(
          //                 ClipboardData(text: alphabet[index].symbol));
          //           },
          //           child: Container(
          //             alignment: Alignment.center,
          //             child: Text(alphabet[index].symbol),
          //             decoration: BoxDecoration(
          //                 color: appThemeData.accentColor,
          //                 borderRadius: BorderRadius.circular(15)),
          //           ),
          //         );
          //       }),
          // ),
          //
          bannerAd
        ],
      ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
