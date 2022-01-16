import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/controller/user_controller.dart';
import 'package:food_ordering_flutter/models/login_model.dart';
import 'package:food_ordering_flutter/models/user.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:food_ordering_flutter/pages/register_page.dart';
import 'package:food_ordering_flutter/services/auth_service.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    UserController _controller = Get.put(UserController(), permanent: true);
    LoginModel _loginModel = LoginModel();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () async {
                _loginModel.email = _emailController.text;
                _loginModel.password = _passwordController.text;
                var user = await _controller.loginUser(_loginModel);
                print("_controller.activeUser.value.errorLogin");
                print(_controller.activeUser.value.errorLogin);
                if (_controller.activeUser.value.errorLogin != null ||
                    _controller.activeUser.value.email == null) {
                  Get.snackbar(
                    'Error',
                    _controller.activeUser.value.errorLogin!.errors!.toString(),
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    duration: Duration(seconds: 3),
                  );
                } else {
                  if (_controller.activeUser.value.email != null) {
                    Get.snackbar(
                      'Login',
                      'Logged in successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                      duration: Duration(seconds: 3),
                    );
                    Get.to(HomePage());
                  }
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Text("Cancel")),
            SizedBox(height: 10),
            Text('Forgot password?'),
            SizedBox(height: 10),
            Text('Don\'t have an account? '),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text('Sign up?'),
              onPressed: () {
                Get.to(RegisterPage());
              },
            ),
          ]),
    );
  }
}
