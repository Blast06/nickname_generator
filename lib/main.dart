import 'package:device_preview/plugins.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:generator/controllers/AdmobController.dart';
import 'package:generator/utils/MyAdmob.dart';
import 'package:generator/utils/Translations.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

import 'ui/pages/splash_screen.dart';
import 'package:flutter/services.dart';

import 'package:device_preview/device_preview.dart';

//THIS IS TO ENABLE DEVICE PREVIEW
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//     await MobileAds.initialize(
//     bannerAdUnitId: MyAdmob.getBannerAdId(),
//     interstitialAdUnitId: MyAdmob.getInterstitialAdId(),
//     appOpenAdUnitId: MyAdmob.getOpenAdId(),

//   );
//   Get.put(AdmobController());
//    runApp(
//       DevicePreview(
//         // enabled: !kReleaseMode,
//         builder: (context) => MyApp(),
//         plugins: [
//           ScreenshotPlugin()
//         ], // Wrap your app
//       ),
//     );

//     }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MobileAds.requestTrackingAuthorization();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  await MobileAds.initialize(
    bannerAdUnitId: MyAdmob.getBannerAdId(),
    interstitialAdUnitId: MyAdmob.getInterstitialAdId(),
    appOpenAdUnitId: MyAdmob.getOpenAdId(),
  );
  // RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("34FEAA5868007783EAE019607349D798"))
  MobileAds.setTestDeviceIds(['34FEAA5868007783EAE019607349D798']);
  Get.put(AdmobController());
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // Admob.requestTrackingAuthorization();
  //
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.greenAccent,
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Locale myLocale;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MyAdmob
          .getAppName(), //TODO add method to retrieve apps name according to Platform
      debugShowCheckedModeBanner: false,
      theme: appThemeData,
      translations: MyTransalations(),
      locale: Get.deviceLocale,
      home: SplashPage(),
      // locale: Get.deviceLocale,
      // translations: MyTransalations(),
    );
  }
}
