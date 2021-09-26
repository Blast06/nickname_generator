import 'package:flutter/material.dart';
import 'package:generator/controllers/AdmobController.dart';
import 'package:generator/controllers/HomeController.dart';
import 'package:generator/controllers/SymbolsListController.dart';
import 'package:generator/routes/app_pages.dart';
import 'package:generator/ui/pages/symbols_page.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';
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

  //setting admob to initialize it
  final ac = Get.find<AdmobController>();
  final bannerController = BannerAdController();

  Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    // hc.checkReview(); //verify for review

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
    final bannerAd = BannerAd(
      controller: bannerController,
      unitId: MyAdmob.getBannerAdId_2(),
      size: BannerSize.ADAPTIVE,
      options: BannerAdOptions(
        reloadWhenSizeChanges: false,
        reloadWhenUnitIdChanges: false,
      ),
    );

    return Scaffold(
      backgroundColor:
          appThemeData.highlightColor, //TODO: ADD THIS TO THE THEME FILE
      body: GetBuilder<HomeController>(
        builder: (_) => Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'symbolsListText'.tr,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _.symbolsList.length,
                itemBuilder: (BuildContext context, int index) {
                  // _.checkReview();
                  // int lastOne = symbols.length - 1;
                  // if (index == lastOne) {
                  //   return Container(
                  //       margin: EdgeInsets.only(left: 7, right: 7),
                  //       child: TextButton(
                  //         onPressed: () {},
                  //         child: Text('More'),
                  //       ));
                  // }

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
                        widget: Icon(Icons.arrow_forward_ios),
                        show: false,
                      ),
                    ),
                  );
                },
              ),
            ),
            bannerAd
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
