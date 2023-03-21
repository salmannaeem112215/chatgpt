import 'package:chatgpt/configs/themes/app_color.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/models_model.dart';
import '../services/api_services.dart';
import './text_widget.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices.getModels(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: TextWidget(label: snapshot.error.toString()),
            );
          }
          return snapshot.data == null || snapshot.data!.isEmpty
              ? const CircularProgressIndicator(
                  color: Colors.white24,
                )
              : ModelsDropDownWidget(modelsItem: snapshot.data!);
        });
  }
}

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key, required this.modelsItem});
  final List<ModelsModel> modelsItem;
  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  late String currentModel;
  @override
  void initState() {
    currentModel = widget.modelsItem[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: DropdownButton(
        items: List<DropdownMenuItem<String>>.generate(
            widget.modelsItem.length,
            (index) => DropdownMenuItem(
                value: widget.modelsItem[index].id,
                child: TextWidget(
                  label: widget.modelsItem[index].id,
                  fontSize: 15,
                ))),
        value: currentModel,
        dropdownColor: primaryColorDark,
        iconEnabledColor: Colors.white,
        onChanged: (value) {
          setState(() {
            currentModel = value.toString();
          });
        },
      ),
    );
  }
}
