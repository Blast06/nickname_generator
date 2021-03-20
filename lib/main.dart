

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:generator/utils/Translations.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:get/get.dart';

import 'ui/pages/splash_screen.dart';
//import 'package:device_preview/device_preview.dart';

//THIS IS TO ENABLE DEVICE PREVIEW
// void main() => runApp(
//       DevicePreview(
//         // enabled: !kReleaseMode,
//         builder: (context) => MyApp(), // Wrap your app
//       ),
//     );

void main(){
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'NicknameGenerator',
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