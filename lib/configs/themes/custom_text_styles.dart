import 'package:chatgpt/configs/themes/app_color.dart';
import 'package:flutter/material.dart';

import './UI_parameters.dart';

TextStyle chatText(context) => TextStyle(
      color: UIParameters.isDarkMode() ? textColorDark : textColorLight,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

const appBarTitleText =
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: iconColor);
const questionText = TextStyle(fontSize: 16, fontWeight: FontWeight.w800);
const headerText = TextStyle(fontSize: 22, fontWeight: FontWeight.w700);
const appBarTS = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
