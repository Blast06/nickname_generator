import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generator/utils/apptheme.dart';
import 'package:generator/utils/colors.dart';
import 'package:get/get.dart';

class SlimCard extends StatelessWidget {
  final String text;

  const SlimCard({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      margin: EdgeInsets.symmetric(vertical: 7),
      decoration: ShapeDecoration(
          color: appThemeData.accentColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  text,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                    color: wood_smoke,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.copy),
            onPressed: () {
              Clipboard.setData(new ClipboardData(text: text));
              Get.snackbar(
                  "snackbar_download_title".tr, "snackbar_download_message".tr,
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: appThemeData.accentColor);
              //TODO: add snackbar when this pressed
            },
          )
        ],
      ),
    );
  }
}
