import 'dart:convert';
import 'dart:io';

import '../../constants/api_constants.dart';
import 'package:http/http.dart' as http;

import '../models/models_model.dart';

class ApiServices {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {"Authorization": "Bearer $OPENAI_API_KEY"},
      );
      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        print("error ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
      final List<ModelsModel> models =
          ModelsModel.modelsFromSnapshot(jsonResponse["data"]);

      return models;
    } catch (e) {
      print("error $e");
      return [];
    }
  }
}
