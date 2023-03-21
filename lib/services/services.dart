import 'package:chatgpt/configs/themes/app_color.dart';
import 'package:chatgpt/widgets/models_drop_down_widget.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services {
  static Future<void> showModalSheet({required BuildContext context}) async {
    return await showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: primaryColorDark,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Flexible(
                  child: TextWidget(
                    label: "Chosen Model: ",
                    fontSize: 16,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: DropDownWidget(),
                ),
              ],
            ),
          );
        });
  }
}
