import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/models/cart.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  List<dynamic> cart = [].obs;
  Rx<double> totalPrice = 0.0.obs;
  //var cart = Cart();

  void addItem(String productId, double price, String title, int quantity,
      String image) {
    cart.add(CartItem(
      id: productId,
      title: title,
      price: price,
      quantity: quantity,
      image: image,
    ));
    totalPrice += price * quantity;
  }

  void removeItem(String productId) {
    totalPrice -= cart.firstWhere((item) => item.id == productId).price;
    cart.removeWhere((item) => item.id == productId);
  }

  double getTotalPrice() {
    // totalPrice.value = 0.0;
    cart.forEach((item) {
      totalPrice += (item.price * item.quantity);
    });
    return totalPrice.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {}
}
