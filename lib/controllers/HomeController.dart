import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:generator/data/models/Symbols.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:in_app_review/in_app_review.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  var logger = Logger();
  bool loadingInfo = false;
  // HttpApi http = HttpApi();
  String profile;
  String nickName = "Nickname";
  String testString = "(¯`·._.·[*]·._.·´¯)";
  Faker faker = Faker();

  final InAppReview inAppReview = InAppReview.instance;

  String videoUrl;

  String _appStoreId = '1547368999';
  List symbols = [];
  bool _isAvailable;

  List<String> moreSymbolsList = [];
  List symbolsList = [
    //TODO Add this to the translations...
    'Spheres ① ② ③ ④ ⑤',
    'Geometric Figures ί ΰ α β γ δ',
    'Emojis 👷 👸 👼 🎅',
    'ASCII ø å ∂ œ',
    'Operators ∽ ∾ ∿≀ ≁ ≂ ',
    'Nick alphabet ◢ ◣ ◤ ◥',
    'More Symbols'
  ];

  void conver2List() {
    for (var i = 0; i < symbols2.length; i++) {
      moreSymbolsList.add(symbols2[i].symbol);
    }
    logger.v(moreSymbolsList);
  }

  getSymbols(int index) {
    logger.v("$index numero");
    switch (index) {
      case 0:
        // logger.v(spheresList);
        symbols = spheresList;
        break;

      case 1:
        // logger.v(geometricFiguresList);
        symbols = geometricFiguresList;
        break;

      case 2:
        // logger.v(emojisList);
        symbols = emojisList;
        break;

      case 3:
        // logger.v(asciiList);
        symbols = asciiList;
        break;

      case 4:
        // logger.v(asciiOperatorsList);
        symbols = asciiOperatorsList;
        break;

      case 5:
        // logger.v(nickAlphabetList);
        symbols = nickAlphabetList;
        break;

      case 6:
        // logger.v(moreSymbolsList);
        symbols = moreSymbolsList;
        break;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    logger.i("ON INIT STARTED :D ");
    conver2List();
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
}
