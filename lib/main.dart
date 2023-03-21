// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './constants/constants.dart';
import './screens/chat/chat_screen.dart';
import './binding/initial_bindings.dart';
import './routes/routes.dart';
import 'configs/themes/app_dark_theme.dart';
import 'configs/themes/app_light_theme.dart';
import 'controllers/theme_controller.dart';

void main() {
  // Get x Controller initialization
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme().buildLigtTheme(),
        // theme: DarkTheme().buildDarkTheme(),
        getPages: AppRoutes.routes());
  }
}
