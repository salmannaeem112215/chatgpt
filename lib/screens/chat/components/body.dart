import 'dart:math';

import 'package:chatgpt/configs/themes/app_color.dart';
import 'package:chatgpt/configs/themes/custom_text_styles.dart';
import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:chatgpt/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final bool _isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  updateModels() async {
    await ApiServices.getModels();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => ChatWidget(
            msg: chatMessages[index]["msg"].toString(),
            chatIndex: int.parse(chatMessages[index]['chatIndex'].toString()),
          ),
        ),
      ),
      if (_isTyping) ...[
        const SpinKitThreeBounce(
          color: iconColor,
          size: 18,
        ),
        // TextField
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: textEditingController,
                  cursorColor: customCursorColor(context),
                  style: textFieldStyle(context),
                  decoration: const InputDecoration(
                    hintText: "How Can I help you",
                  ),
                  onSubmitted: (value) {
                    // TODO send message
                  },
                ),
              ),
              IconButton(
                onPressed: () => updateModels(),
                icon: const Icon(
                  Icons.send,
                ),
              ),
            ],
          ),
        ),
      ],
    ]);
  }
}
