import 'package:food_ordering_flutter/constants/constants.dart';
import 'package:food_ordering_flutter/models/error_login.dart';
import 'package:food_ordering_flutter/models/login_model.dart';
import 'package:food_ordering_flutter/models/register_model.dart';
import 'package:food_ordering_flutter/models/user.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  String? token;
  static Future<User?> loginUser(LoginModel model) async {
    var response = await http.post(
      Uri.parse(Constants.login),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(model.toJson()),
      //body: model,
    );

    print(response.toString());
    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> responseData = json.decode(response.body);
        // print(responseData);
        // if (responseData.containsKey('token')) {
        //  print("object");
        // token = responseData['token'];
        var user = User.fromJson(responseData);
        user.errorLogin = ErrorLogin.fromJson((responseData));
        return user;
      } catch (e) {
        return User();
      }
    } else {
      try {
        User usernl = User();
        final Map<String, dynamic> responseData = json.decode(response.body);
        //print(response.body.toString());
        // usernl.errorLogin = responseData['errors'];
        usernl.errorLogin = ErrorLogin.fromJson((responseData));

        return usernl;
      } catch (e) {
        print("eror");
        var user = User();
        ErrorLogin errorLogin = ErrorLogin();

        Map<String, dynamic>? errors = {'error': "Please try again later.."};

        errorLogin.errors = errors;

        //  user.errorLogin = ErrorLogin.fromJson((errors));
        user.errorLogin = errorLogin;

        return user;
      }
    }
    //  return response.body;
    //} else {
    //   token = null;
    //return null;
  }

  bool logoutUser() {
    // token = null;
    Get.to(HomePage());
    return true;
  }

  static Future<RegisterModel?> registerUser(RegisterModel model) async {
    model.image = "";
    print(json.encode(model));
    try {
      var response = await http.post(
        Uri.parse(Constants.registerUser),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: json.encode(model),
        //  encoding: Encoding.getByName("utf-8")
      );
      print("response");
      print(response.statusCode);
      if (response.statusCode == 200) {
        //  List<dynamic> body = json.decode(response.body);
        print("response.body");
        print(response.body);
        model.message = response.body;
        // print(JsonEncoder().convert(body) as RegisterModel);
        // if (response.body.contains("User Registered with username")) {
        return model;
        // } else {
        //   return null;
        // }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
