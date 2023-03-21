import 'package:chatgpt/configs/themes/ui_parameters.dart';
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

  IconButtonThemeData getIconButtonTheme() {
    return IconButtonThemeData(
        style: IconButton.styleFrom(
      foregroundColor: iconColor,
      hoverColor: iconHoverColor,
    ));
  }

  InputDecorationTheme getInputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: botChatColorDark,
      filled: UIParameters.isDarkMode() ? true : false,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:
              UIParameters.isDarkMode() ? Colors.transparent : Colors.black26,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: UIParameters.isDarkMode()
                ? Colors.transparent
                : Colors.black38),
      ),
    );
  }
}
