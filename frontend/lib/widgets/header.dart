import 'package:flutter/material.dart';
import 'package:lost_and_found/utils/constants.dart';

AppBar header(context, { bool isAppTitle = false, String titleText = ''}) {
  return AppBar(
    title: Text(
      isAppTitle ? Constants.lostAndFound : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Signatra',
        fontSize: 40.0
      ),
    ),
    centerTitle: true,
    backgroundColor: Constants.lighterThemeColor,
  );
}
