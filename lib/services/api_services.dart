import 'dart:convert';
import 'dart:io';

import '../../constants/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<void> getModel() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/modelss"),
        headers: {"Authorization": "Bearer $OPENAI_API_KEY"},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print("error ${jsonResponse['error']['message']}");
        throw HttpException(jsonResponse['error']['message']);
      }
    } catch (e) {
      print("error $e");
    }
  }
}
