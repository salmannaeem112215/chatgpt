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
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(height: 15),
        Material(
          // color: cardColor,
          child: Padding(
            padding: textFieldPadding,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: textEditingController,
                    onSubmitted: (value) {
                      print('hi');
                      // TODO send message
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: "How Can I help you",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                IconButton(
                    onPressed: () => updateModels(),
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ],
    ]);
  }
}
