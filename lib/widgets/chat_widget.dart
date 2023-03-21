import 'package:chatgpt/configs/themes/app_color.dart';
import 'package:chatgpt/configs/themes/custom_text_styles.dart';
import 'package:chatgpt/constants/constants.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:chatgpt/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.msg,
    required this.chatIndex,
  });
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: chatIndex == 0
          ? customUserChatColor(context)
          : customBotChatColor(context),
      child: Container(
        decoration: BoxDecoration(
            border: chatIndex == 0
                ? null
                : Border.symmetric(
                    horizontal: BorderSide(
                        color: Color.fromARGB(29, 0, 0, 0), width: 1))),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              chatIndex == 0 ? AssetsManager.userImage : AssetsManager.botImage,
              height: 30,
              width: 30,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                msg,
                style: chatText(context),
              ),
            ),
            const SizedBox(width: 8),
            chatIndex == 0
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.thumb_down_alt_outlined,
                      )
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
