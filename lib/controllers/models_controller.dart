// ignore: depend_on_referenced_packages
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../models/models_model.dart';
import '../services/api_services.dart';

enum ModelsState { error, loading, successfull, empty }

class ModelsController extends GetxController {
  final _modelsState = ModelsState.empty.obs;
  final _models = <ModelsModel>[].obs;
  final Rx<String?> _currentModel = null.obs;

  @override
  void onReady() {
    initModels();
    super.onReady();
  }

  void initModels() async {
    _modelsState.value = ModelsState.loading;

    // Fetching Models through API
    final modelsList = await ApiServices.getModels();
    // data succesfully loaded
    if (modelsList.isNotEmpty) {
      _modelsState.value = ModelsState.successfull;
      _models.assignAll(modelsList);
    } else {
      _modelsState.value = ModelsState.error;
      _models.assignAll([]);
    }
  }

  // Current Model getter & setter
  void setCurrentModel(String? value) {
    _currentModel.value = value;
  }

  String? getCurrentModel() {
    return _currentModel.value;
  }
}

// class DropDownWidget extends StatelessWidget {
//   const DropDownWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: ApiServices.getModels(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: TextWidget(label: snapshot.error.toString()),
//             );
//           }
//           return snapshot.data == null || snapshot.data!.isEmpty
//               ? const CircularProgressIndicator(
//                   color: Colors.white24,
//                 )
//               : ModelsDropDownWidget(modelsItem: snapshot.data!);
//         });
//   }
// }

// class ModelsDropDownWidget extends StatefulWidget {
//   const ModelsDropDownWidget({super.key, required this.modelsItem});
//   final List<ModelsModel> modelsItem;
//   @override
//   State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
// }

// class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
//   late String currentModel;
//   @override
//   void initState() {
//     currentModel = widget.modelsItem[0].id;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       child: DropdownButton(
//         items: List<DropdownMenuItem<String>>.generate(
//             widget.modelsItem.length,
//             (index) => DropdownMenuItem(
//                 value: widget.modelsItem[index].id,
//                 child: TextWidget(
//                   label: widget.modelsItem[index].id,
//                   fontSize: 15,
//                 ))),
//         value: currentModel,
//         dropdownColor: scaffoldBackgroundColor,
//         iconEnabledColor: Colors.white,
//         onChanged: (value) {
//           setState(() {
//             currentModel = value.toString();
//           });
//         },
//       ),
//     );
//   }
// }
