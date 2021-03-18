import 'package:flutter/material.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:generator/ui/widgets/custom_search_text.dart';
import 'package:generator/ui/widgets/slim_card.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


class HomePage extends StatelessWidget {
  final hc = Get.put(HomeController());
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      appBar: AppBar(title: Text('Nickname Generator')),
      body: GetBuilder<HomeController>(
        builder: (_) => Column(
            children: [
               Container(
                 margin: EdgeInsets.only(top:7,bottom:7,left:6,right:6),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
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
                              // nameController.text = text;
                            },
                          ),
                      ),
                      
                      IconButton(icon: Icon(Icons.restore_sharp), onPressed: () => hc.generateRandomNickName() ,)

                    ],
                  ),
               ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: symbols.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(left:7,right:7),
                      child: SlimCard(
                          text: _.replaceString(symbols[index].symbol, _.nickName),
                        
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
    );
  }
}
