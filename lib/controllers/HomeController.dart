


import 'package:faker/faker.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  var logger = Logger();
  bool loadingInfo = false;
  // HttpApi http = HttpApi();
  String profile;
  String nickName = "Nickname";
  String testString = "(¯`·._.·[*]·._.·´¯)";
  Faker faker = Faker();

 


  String videoUrl;

  String _appStoreId = '1547368999';
  bool _isAvailable;

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
  changeNickName(text) {
    nickName = text;
    update();
  }

  generateRandomNickName() {
    String text = faker.internet.userName();
    changeNickName(text);
  }

  String replaceString(text, textToReplace) {
    text = text.replaceAll('1', textToReplace); 
    
    update();

    return text;
  }



  @override
  void onInit() async {
    super.onInit();
    logger.i("ON INIT STARTED :D ");
    replaceString(testString, "Blast06");
   
  }

  @override
  void onClose() async {
    super.onClose();
  }



  //checks if review is available
  // checkReview() async {
  //   if (await inAppReview.isAvailable()) {
  //     inAppReview.requestReview();
  //   } else {
  //     inAppReview.openStoreListing(appStoreId: _appStoreId);
  //   }
  // }

 
}