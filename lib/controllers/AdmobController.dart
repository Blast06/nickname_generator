import 'dart:io';

import 'package:generator/utils/MyAdmob.dart';
import 'package:get/get.dart';

import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

const TEST = true;

class AdmobController extends GetxController {
  // AdmobInterstitial interstitialAd;
  InterstitialAd myInterstitial;

  Logger logger = Logger();
  AdWidget adWidget;
  BannerAd symbolsPageBanner;

  @override
  void onInit() {
    super.onInit();
    // getInfo();
    logger.i("ADMOB CONTROLLER STARTED");
    prepareAds();

  }

  prepareAds() {
    BannerAd symbolsPageBanner = BannerAd(
      adUnitId: getBannerAdId(),
      size: AdSize.banner,
      request: AdRequest(),
      listener: AdListener(),
    );
    symbolsPageBanner.load();
    adWidget = AdWidget(ad: symbolsPageBanner);
  }

  String getAdMobAppId() {
    if (Platform.isIOS) {
      return TEST ? MyAdmob.TEST_app_id_ios : MyAdmob.PROD_app_id_ios;
    } else if (Platform.isAndroid) {
      return TEST ? MyAdmob.TEST_app_id_android : MyAdmob.PROD_app_id_android;
    }
    return null;
  }

  String getBannerAdId() {
    if (Platform.isIOS) {
      // return ;
      return TEST ? MyAdmob.TEST_banner_id_ios : MyAdmob.PROD_banner_id_ios;
    } else if (Platform.isAndroid) {
      // return ;
      return TEST
          ? MyAdmob.TEST_banner_id_android
          : MyAdmob.PROD_banner_id_android;
    }
    return null;
  }

  String getInterstitialAdId() {
    if (Platform.isIOS) {
      return TEST
          ? MyAdmob.TEST_interstitial_id_ios
          : MyAdmob.PROD_interstitial_id_ios;
    } else if (Platform.isAndroid) {
      return TEST
          ? MyAdmob.TEST_interstitial_id_android
          : MyAdmob.PROD_interstitial_id_android;
    }
    return null;
  }

  loadInterstitial() {
    myInterstitial = InterstitialAd(
      adUnitId: getInterstitialAdId(),
      request: AdRequest(),
      listener: AdListener(),
    );

    logger.i("interstitial loading..");

    myInterstitial.load();
  }

  showInterstitial() async {
    myInterstitial.show();

    // if (await interstitialAd.isLoaded) {
    //   logger.i("interstitial is loaded");
    //   interstitialAd.show();
    // }
  }

  final AdListener interAdListener = AdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) => print('Ad loaded.'),
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      ad.dispose();
      print('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => print('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) {
      ad.dispose();
      print('Ad closed.');
    },
    // Called when an ad is in the process of leaving the application.
    onApplicationExit: (Ad ad) => print('Left application.'),
  );
}

final AdListener bannerAdListener = AdListener(
  // Called when an ad is successfully received.
  onAdLoaded: (Ad ad) => print('Ad loaded.'),
  // Called when an ad request failed.
  onAdFailedToLoad: (Ad ad, LoadAdError error) {
    ad.dispose();
    print('Ad failed to load: $error');
  },
  // Called when an ad opens an overlay that covers the screen.
  onAdOpened: (Ad ad) => print('Ad opened.'),
  // Called when an ad removes an overlay that covers the screen.
  onAdClosed: (Ad ad) => print('Ad closed.'),
  // Called when an ad is in the process of leaving the application.
  onApplicationExit: (Ad ad) => print('Left application.'),
);
