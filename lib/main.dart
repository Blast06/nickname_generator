

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:generator/controllers/AdmobController.dart';
import 'package:generator/utils/MyAdmob.dart';
import 'package:generator/utils/Translations.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

import 'ui/pages/splash_screen.dart';
//import 'package:device_preview/device_preview.dart';

//THIS IS TO ENABLE DEVICE PREVIEW
// void main() => runApp(
//       DevicePreview(
//         // enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.initialize(
    bannerAdUnitId: 'ca-app-pub-3940256099942544/6300978111',
    interstitialAdUnitId: MyAdmob.getInterstitialAdId(),
    appOpenAdUnitId: 'ca-app-pub-3940256099942544/3419835294',
    
  );
  // RequestConfiguration.Builder().setTestDeviceIds(Arrays.asList("34FEAA5868007783EAE019607349D798"))
  MobileAds.setTestDeviceIds(['34FEAA5868007783EAE019607349D798']);
  Get.put(AdmobController());
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // Admob.requestTrackingAuthorization();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Locale myLocale;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'names',
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