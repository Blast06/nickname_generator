import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:in_app_review/in_app_review.dart';

class SymbolsListcontroller extends GetxController {
  int currentIndex = 0;
  var logger = Logger();
  bool loadingInfo = false;
  // HttpApi http = HttpApi();
  String profile;
  String nickName = "Nickname";
  String testString = "(¯`·._.·[*]·._.·´¯)";
  Faker faker = Faker();
  RxBool show = true.obs;
  List symbolsList = ['Spheres', 'Alphabet', 'Emojis', 'ASCII', 'Operators', 'Geometric', 'Fancy Numbers', 'Rounded alphabet' ];

  final InAppReview inAppReview = InAppReview.instance;

  String videoUrl;

  String _appStoreId = '1547368999';
  bool _isAvailable;


   @override
  void onInit() async {
    super.onInit();
    logger.i("ON INIT STARTED :D SymbolsController ");
    
  }

  @override
  void onClose() async {
    super.onClose();
  }

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
    // update();
    return text;
  }

  inputText(String text, int position) {
    if (position > -1) {
      changeNickName(StringUtils.addCharAtPosition(nickName, text, position));
      update();
    } else {
      nickName = nickName + text;
      update();
    }
    // nickName = text.substring(position,position);

    logger.v("nickname: $nickName text: $text position: $position");
  }


 

  // checks if review is available
  checkReview() async {
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      inAppReview.openStoreListing(appStoreId: _appStoreId);
    }
  }

    void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }

  getSymbols(int index){
    logger.v(index);
    switch (index) {
      case 1:
        symbolsList = symbols2;
        break;
      
      case 2:
        symbolsList = numbersSymbols;
        break;

      case 3:
        symbolsList = alphabetSymbols;
        break;

      case 4:
        symbolsList = spheresList;
        break;

      case 5:
        symbolsList = nickAlphabetList;
        break;

      case 6:
        symbolsList = emojisList;
        break;

      case 7:
        symbolsList = asciiList;
        break;

      case 8:
        symbolsList = asciiOperatorsList;
        break;

      case 9:
        symbolsList =  geometricFiguresList;
        break;
    }

  }


}
