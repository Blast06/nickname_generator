import 'package:flutter/material.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/ui/widgets/custom_search_text.dart';
import 'package:generator/ui/widgets/slim_card.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class HomePage extends StatelessWidget {
  final hc = Get.put(HomeController());
  final TextEditingController nameController = TextEditingController();

  final bannerAd = BannerAd(
    // controller: bannerController,
    size: BannerSize.ADAPTIVE,
    options: BannerAdOptions(
      reloadWhenSizeChanges: false,
      reloadWhenUnitIdChanges: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        title: Text('Nickname Generator'),
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(
            builder: (_) => Container(
              margin: EdgeInsets.only(top: 30, left: 18, right: 18),
              child: CustomSearchText(
                text: hc.nickName,
                enable: true,
                callback: () {
                  nameController.text = hc.nickName;
                  // TODO: Fix bug when generating new nickname and does not change in textbox...
                },
                controller: nameController,
                callback2: (text) {
                  _.changeNickName(text);
                },
              ),
            ),
          ),

          //TODO: Use svg icon
          GetBuilder<HomeController>(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.restore_sharp),
                  onPressed: () => hc.generateRandomNickName(),
                ),
                IconButton(
                    icon: Icon(Icons.copy_rounded),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: hc.nickName));
                       Get.snackbar("snackbar_download_title".tr,
                        "snackbar_download_message".tr,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: appThemeData.accentColor);
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Expanded(
            child: GetBuilder<HomeController>(
              builder: (_) => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: symbols.length,
                itemBuilder: (BuildContext context, int index) {
                  int lastOne = symbols.length - 1;
                  if (index == lastOne) {
                    return Container(
                        margin: EdgeInsets.only(left: 7, right: 7),
                        child: TextButton(
                          onPressed: () {},
                          child: Text('More'),
                        ));
                  }

                  // return Text('holaa');
                  return Container(
                    margin: EdgeInsets.only(left: 7, right: 7),
                    child: SlimCard(
                        text:
                            _.replaceString(symbols[index].symbol, _.nickName)),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
