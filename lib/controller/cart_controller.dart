import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/models/cart.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  Rx<Cart> cart = Cart().obs;
  Rx<double> totalPrice = 0.0.obs;
  //var cart = Cart();

  void addItem(String productId, double price, String title, int quantity,
      String image) {
    cart.value.items.add(CartItem(
      id: productId,
      title: title,
      price: price,
      quantity: quantity,
      image: image,
    ));
    totalPrice += price * quantity;
  }

  void removeItem(String productId) {
    totalPrice -=
        cart.value.items.firstWhere((item) => item.id == productId).price;
    cart.value.items.removeWhere((item) => item.id == productId);
  }

  double getTotalPrice() {
    // totalPrice.value = 0.0;
    cart.value.items.forEach((item) {
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

  void clearCart() {
    cart.value.items.clear();
    totalPrice.value = 0.0;
  }
}
