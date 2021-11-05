import 'package:flutter/material.dart';
import 'package:generator/controllers/AdmobController.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/controllers/SymbolsListController.dart';
import 'package:generator/routes/app_pages.dart';
import 'package:generator/ui/pages/names_page.dart';
import 'package:generator/ui/pages/symbols_page.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
import 'package:generator/ui/widgets/curved_navigation_bar.dart';
import 'package:generator/ui/widgets/slim_card.dart';
import 'package:generator/utils/MyAdmob.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class SymbolsListPage extends StatefulWidget {
  @override
  _SymbolsListPageState createState() => _SymbolsListPageState();
}

class _SymbolsListPageState extends State<SymbolsListPage> {
  final sc = Get.put(SymbolsListcontroller());
  final hc = Get.put(HomeController());

  Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    // hc.checkReview(); //verify for review
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeData.backgroundColor,
      body: GetBuilder<HomeController>(
        builder: (_) => Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'symbolsListText'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: appThemeData.accentColor),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _.symbolsList.length,
                itemBuilder: (BuildContext context, int index) {
                  // _.checkReview();
                  int lastOne = _.symbolsList.length - 1;
                  if (index == lastOne) {
                    return GestureDetector(
                      onTap: () {
                        logger.v("PROBANDO PARA IR A PAGINA 👌👌 $index");
                        Get.off(NamesPage());
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 7, right: 7),
                        child: SlimCard(
                          text: 'names_page'.tr,
                          widget: Icon(
                            Icons.arrow_forward_ios,
                            color: appThemeData.splashColor,
                          ),
                          show: true,
                        ),
                      ),
                    );
                  }

                  // return Text('holaa');
                  return GestureDetector(
                    onTap: () {
                      logger.v("PROBANDO PARA IR A PAGINA 👌👌 $index");
                      Get.off(SymbolsPage());
                      _.getSymbols(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 7, right: 7),
                      child: SlimCard(
                        text: _.symbolsList[index],
                        widget: Icon(
                          Icons.arrow_forward_ios,
                          color: appThemeData.splashColor,
                        ),
                        show: true,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
