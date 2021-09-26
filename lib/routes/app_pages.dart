import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/splash_screen.dart';
import 'package:generator/ui/pages/start_page.dart';
import 'package:generator/ui/pages/symbols_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage()),
    GetPage(name: Routes.START, page: () => StartPage()),
    GetPage(name: Routes.HOME_PAGE, page: () => HomePage()),
    GetPage(name: Routes.SYMBOLS_PAGE, page: () => SymbolsPage()),
  ];
}
