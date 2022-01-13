import 'package:food_ordering_flutter/constants/constants.dart';
import 'package:food_ordering_flutter/models/login_model.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  String? token;
  Future<String?> loginUser(LoginModel model) async {
    var response = await http.post(
      Uri.parse(Constants.login),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(model.toJson()),
      //body: model,
    );

    print(response.body);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      if (responseData.containsKey('token')) {
        print("object");
        token = responseData['token'];
        return responseData['token'];
      } else {
        token = null;
        return null;
      }
      //  return response.body;
    } else {
      token = null;
      return null;
    }
  }

  bool logoutUser() {
    token = null;
    Get.to(HomePage());
    return true;
  }
}
