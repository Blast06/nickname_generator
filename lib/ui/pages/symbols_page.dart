import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/ui/widgets/custom_search_text.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class SymbolsPage extends StatelessWidget {
  final hc = Get.put(HomeController());
  final TextEditingController nameController = TextEditingController();
  Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        title: Text('name'),
        backgroundColor: appThemeData.primaryColor,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) => Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30, left: 18, right: 18),
              child: CustomSearchText(
                text: hc.nickName,
                enable: true,
                callback: () {
                  nameController.text = hc.nickName;
                  TextSelection.fromPosition(
                      TextPosition(offset: nameController.text.length));
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
                IconButton(
                  icon: Icon(Icons.restore_sharp),
                  onPressed: () {
                    hc.generateRandomNickName();
                    // FocusScope.of(context).unfocus();
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share_rounded),
                  onPressed: () => hc
                      .generateRandomNickName(), //TODO: Add share nickname feature
                ),
                IconButton(
                    icon: Icon(Icons.copy_rounded),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: hc.nickName));
                      Get.snackbar("snackbar_download_title".tr,
                          "snackbar_download_message".tr,
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: appThemeData.accentColor);
                      // nameController.selection = TextSelection.fromPosition(TextPosition(offset: nameController.text.length));
                    }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
