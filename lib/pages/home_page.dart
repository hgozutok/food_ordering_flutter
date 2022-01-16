import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/components/home_body.dart';
import 'package:food_ordering_flutter/constants/colors.dart';
import 'package:food_ordering_flutter/controller/cart_controller.dart';
import 'package:food_ordering_flutter/models/routes.dart';
import 'package:food_ordering_flutter/pages/cart_page.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag, color: secondaryColor),
            onPressed: () {
              //  Get.offAll(CartPage());
              // Get.toNamed(Routes.cart);
              Get.to(CartPage());
            },
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
