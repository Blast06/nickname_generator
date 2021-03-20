import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/ui/widgets/custom_search_text.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';

class SymbolsPage extends StatelessWidget {
  final hc = Get.put(HomeController());
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(
        title: Text('Nickname Generator'),
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
                  // TODO: Fix bug when generating new nickname and does not change in textbox...
                },
                controller: nameController,
                callback2: (text) {
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
                  onPressed: () => hc.generateRandomNickName(),
                ),
                IconButton(
                  icon: Icon(Icons.share_rounded),
                  onPressed: () => hc.generateRandomNickName(),
                ),
                IconButton(
                    icon: Icon(Icons.copy_rounded),
                    onPressed: () =>
                        Clipboard.setData(ClipboardData(text: hc.nickName))),
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
                      crossAxisCount: 4),
                  itemCount: symbols2.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(symbols2[index].symbol),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15)),
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
