import 'package:flutter/material.dart';

import '../models/models_model.dart';
import '../widgets/text_widget.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

const double appBarIconRadius = 10;
const textFieldPadding = EdgeInsets.only(left: 20, top: 8, bottom: 8, right: 8);

List<String> models = [
  "Model 1",
  "Model 2",
  "Model 3",
  "Model 4",
  "Model 5",
  "Model 6",
];

List<DropdownMenuItem<String>>? get getModelsItem {
  List<DropdownMenuItem<String>>? modelsItem =
      List<DropdownMenuItem<String>>.generate(
    models.length,
    (index) => DropdownMenuItem(
      value: models[index],
      child: TextWidget(
        label: models[index],
        fontSize: 15,
      ),
    ),
  );
  return modelsItem;
}

List<DropdownMenuItem<String>>? getModelsDropDownItem(
    List<ModelsModel> models) {
  List<DropdownMenuItem<String>>? modelsItem =
      List<DropdownMenuItem<String>>.generate(
    models.length,
    (index) {
      print(models[index].id);
      return DropdownMenuItem(
        value: models[index].id,
        child: TextWidget(
          label: models[index].id,
          fontSize: 15,
        ),
      );
    },
  );
  return modelsItem;
}

final chatMessages = [
  {
    "msg": "Hello who are you?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Hello, I am ChatGPT, a large language model developed by OpenAI. I am here to assist you with any information or questions you may have. How can I help you today?",
    "chatIndex": 1,
  },
  {
    "msg": "What is flutter?",
    "chatIndex": 0,
  },
  {
    "msg":
        "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, and the web. Flutter uses the Dart programming language and allows for the creation of high-performance, visually attractive, and responsive apps. It also has a growing and supportive community, and offers many customizable widgets for building beautiful and responsive user interfaces.",
    "chatIndex": 1,
  },
  {
    "msg": "Okay thanks",
    "chatIndex": 0,
  },
  {
    "msg":
        "You're welcome! Let me know if you have any other questions or if there's anything else I can help you with.",
    "chatIndex": 1,
  },
];
