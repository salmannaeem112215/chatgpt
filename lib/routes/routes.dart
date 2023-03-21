// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import 'package:chatgpt/screens/chat/chat_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const ChatScreen()),
      ];
}
