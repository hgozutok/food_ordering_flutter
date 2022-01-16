import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/controller/user_controller.dart';
import 'package:food_ordering_flutter/models/register_model.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserController _controller = Get.put(UserController(), permanent: true);
  RegisterModel model = RegisterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Register Page'),
          SizedBox(height: 10),
          TextField(
            controller: _controller.firstNameController,
            decoration: InputDecoration(
              hintText: 'First Name',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controller.lastNameNameController,
            decoration: InputDecoration(
              hintText: 'Last Name',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controller.emailController,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _controller.userNameController,
            decoration: InputDecoration(
              hintText: 'Username',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            controller: _controller.passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            obscureText: true,
            controller: _controller.confirmPasswordController,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            child: Text('Register'),
            onPressed: () async {
              model.firstName = _controller.firstNameController.text;
              model.lastName = _controller.lastNameNameController.text;
              model.email = _controller.emailController.text;
              model.password = _controller.passwordController.text;
              model.username = _controller.userNameController.text;

              var user = await _controller.RegisterUser(model);
              if (user.message
                  .toString()
                  .contains("User Registered with username")) {
                Get.to(HomePage());
              } else {
                Get.snackbar(
                  'Error',
                  user.message.toString(),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.red,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

  // {this.firstName,
  //     this.lastName,
  //     this.username,
  //     this.email,
  //     this.password,
  //     this.image});
