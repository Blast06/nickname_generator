import 'package:generator/ui/pages/home_page.dart';
import 'package:generator/ui/pages/privacy_policy.dart';
import 'package:generator/ui/pages/symbols_list_page.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class GlobalController extends GetxController {
  int currentIndex = 0;
  Logger logger = Logger();
  @override
  void onInit() {
    logger.v("GlobalController created 🤣");
    super.onInit();
    // getInfo();
  }

  void changeCurrentIndex(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        Get.off(() => HomePage(), transition: Transition.cupertino);

        break;
      case 1:
        Get.off(() => SymbolsListPage(), transition: Transition.cupertino);

        break;
      case 2:
        Get.off(() => PrivacyPolicy(), transition: Transition.cupertino);

        break;
      default:
        Get.off(() => HomePage(), transition: Transition.zoom);

        break;
    }
    update();
  }
}
