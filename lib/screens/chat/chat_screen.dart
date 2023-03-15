import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../services/assets_manager.dart';
import './components/body.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(appBarIconRadius),
            child: Image.asset(
              AssetsManager.openaiLogo,
            ),
          ),
        ),
        title: const Text('ChatGpt'),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: option buttons
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
