import 'package:flutter/material.dart';

class DarkStyles {
  static Color scaffoldBackgroundColor = const Color(0xFF121212);
  static Color defaultRedColor = const Color(0xffff4d4d);
  static Color defaultYellowColor = const Color(0xFFffeb3b);
  static Color defaultBlueColor = const Color(0xff39c0ff);
  static Color defaultGreyColor = const Color(0xffb0bec5);
  static Color defaultLightGreyColor = const Color(0xff90a4ae);
  static Color defaultLightWhiteColor = const Color(0xFFffffff);

  static double defaultPadding = 18.0;

  static BorderRadius defaultBorderRadius = BorderRadius.circular(20);

  static ScrollbarThemeData scrollbarTheme =
      const ScrollbarThemeData().copyWith(
    thumbColor: WidgetStateProperty.all(defaultYellowColor),
    thumbVisibility: WidgetStateProperty.all(false),
    interactive: true,
  );
}
