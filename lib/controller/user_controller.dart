import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/models/menu.dart';
import 'package:food_ordering_flutter/models/register_model.dart';
import 'package:food_ordering_flutter/services/auth_service.dart';

import 'package:food_ordering_flutter/services/remote_services.dart';

import 'package:get/get.dart';

class UserController extends GetxController {
  Rx<RegisterModel> activeUser = RegisterModel().obs;

  late Future<String> pname;
  ScrollController controller = ScrollController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  late var _loading = false.obs;

  get loading => _loading.value;

  @override
  void onInit() {
    //controller.addListener((pagination));

    super.onInit();
  }

  @override
  void onDispose() {
    //controller.dispose();
  }

  Future<RegisterModel> RegisterUser(RegisterModel model) async {
    _loading.value = true;
    var user = await AuthService.registerUser(model);
    //print("menuLists");
    print(user!);
    if (user != null) {
      activeUser.value = user;
    }
    print("user");
    print(user);

    _loading.value = false;

    return user;
  }
}
