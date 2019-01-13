import 'package:flutter/material.dart';

class GlobalConfig {
  static bool dark = true;
  static ThemeData themeData = new ThemeData(
    primaryColor: Color(0xFFF5F5F5)
  );
  static Color appBarBackgroundColor = new Color(0xFFF5F5F5);
  static Color pageBackgroundColor = new Color(0xFFDCDCDC);
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