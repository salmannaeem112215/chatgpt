import 'package:flutter/material.dart';
import 'package:chatgpt/configs/themes/app_color.dart';

//mixin is used to inherit multiple classes in dart
mixin SubThemeData {
  TextTheme getTextThemes() {
    return const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // IconThemeData getIconTheme() {
  //   return const IconThemeData(color: iconColor, size: 16);
  // }

  IconButtonThemeData getIconButtonTheme() {
    return IconButtonThemeData(
        style: IconButton.styleFrom(
      foregroundColor: iconColor,
      hoverColor: iconHoverColor,
    ));
  }
}
