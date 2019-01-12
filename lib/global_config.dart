import 'package:flutter/material.dart';

class GlobalConfig {
  static bool dark = true;
  static ThemeData themeData = new ThemeData(
    primaryColor: Color.fromRGBO(233, 116, 89, 1.0)
  );
  static Color searchBackgroundColor = Colors.white10;
  static Color cardBackgroundColor = new Color(0xFF222222);
  static Color fontColor = Colors.white30;

  static TextStyle t1 = TextStyle(
      fontSize: 16,
      color:new Color(0xFF222222),
      fontFamily:'PingFangHK-Semibold'
  );

  static TextStyle t2 = TextStyle(
      fontSize:12.0,
      color:new Color(0xFF222222),
      fontFamily: 'PingFangHK-Semibold'
  );
}