import 'package:chatgpt/configs/themes/custom_text_styles.dart';
import 'package:flutter/material.dart';

import './sub_theme_data_mixin.dart';
import './app_color.dart';

class DarkTheme with SubThemeData {
  // with is used instead of extends for mixin class
  ThemeData buildDarkTheme() {
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColorDark,
          foregroundColor: iconColor,
        ),
        scaffoldBackgroundColor: Color(0xff353541),
        cardColor: cardColorDark,
        // iconTheme: getIconTheme(),
        iconButtonTheme: getIconButtonTheme(),
        textTheme: getTextThemes()
            .apply(bodyColor: textColorDark, displayColor: textColorDark));
  }
}
