// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';

import './ui_parameters.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color card1Color = const Color(0xFFF7F7F8);
Color card2Color = const Color(0xFF444654);

const double appBarIconRadius = 10;
const textFieldPadding = EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 8);

const Color primaryColorDark = Color(0xFF353541);
const Color cardColorDark = Color(0xFF454654);
const Color cardHoverColorDark = Color(0xFF202123);
const Color textFieldColorDark = Color(0xFF454654);
const Color textColorDark = Color(0xFFD1D5DB);

const Color primaryColorLight = Color(0xFFFFFFFF);
const Color cardColorLight = Color(0xFFF7F7F8);
const Color cardHoverColorLight = Color(0xFFD9D9E3);
const Color textFieldColorLight = Color(0xFFFFFFFF);
const Color textColorLight = Color(0xFF384051);

const Color drawerColor = Color(0xFF202123);
const Color iconColor = Color(0xFFD9D9E3);
const Color iconHoverColor = Color(0xFF202123);

// Chat Color
const Color userChatColorLight = Colors.transparent;
// const Color userChatColorLight = Color(0xFFFFFFFF);
const Color botChatColorLight = Color(0xFFF7F7F8);

const Color userChatColorDark = Colors.transparent;
// const Color userChatColorDark = Color(0xFF353541);
const Color botChatColorDark = Color(0xFF454654);

Color customUserChatColor(BuildContext context) =>
    UIParameters.isDarkMode() ? userChatColorDark : userChatColorLight;

Color customBotChatColor(BuildContext context) =>
    UIParameters.isDarkMode() ? botChatColorDark : botChatColorLight;
