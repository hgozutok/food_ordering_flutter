import 'package:food_ordering_flutter/constants/constants.dart';
import 'package:food_ordering_flutter/models/menu.dart';
import 'package:food_ordering_flutter/models/menu_type.dart';
import 'package:food_ordering_flutter/models/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteService {
  static Future<List<MenuType>?> getMenuTypes() async {
    try {
      var response = await http.get(Uri.parse(Constants.menuTypes));

      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);

        return body.map((dynamic item) => MenuType.fromJson(item)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Menu>?> getMenus() async {
    try {
      var response = await http.get(Uri.parse(Constants.menus));
      //print("response.body");
      //print(response);
      if (response.statusCode == 200) {
        List<dynamic> body = json.decode(response.body);
        // print("response.body");
        // print(response.body);
        return body.map((dynamic item) => Menu.fromJson(item)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
