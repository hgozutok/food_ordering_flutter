import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/controller/user_controller.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController _controller = Get.put(UserController(), permanent: true);

    return Scaffold(
      body: Column(children: [
        Text('User Profile'),
        ElevatedButton(
            onPressed: () {
              _controller.logoutUser();
              Get.to(HomePage());
            },
            child: Text("Logout")),
      ]),
    );
  }
}
