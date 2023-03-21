import 'package:chatgpt/configs/themes/app_color.dart';
import 'package:chatgpt/configs/themes/custom_text_styles.dart';
import 'package:chatgpt/controllers/theme_controller.dart';
import 'package:chatgpt/services/assets_manager.dart';
import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

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
    final themeController = Get.find<ThemeController>();
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          border: chatIndex == 0 ? null : customBotChatBorder,
          color: chatIndex == 0
              ? themeController.customUserChatColor(context)
              : themeController.customBotChatColor(context),
        ),
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
                style: themeController.chatText(context),
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
