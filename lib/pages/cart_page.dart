import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/constants/colors.dart';
import 'package:food_ordering_flutter/controller/cart_controller.dart';
import 'package:food_ordering_flutter/controller/user_controller.dart';

import 'package:food_ordering_flutter/models/cart.dart';
import 'package:food_ordering_flutter/models/order.dart';
import 'package:food_ordering_flutter/pages/checkout_page.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  //Cart cart = Get.put(Cart());
  CartController cartController = Get.put(
    CartController(),
    permanent: true,
  );
  UserController userController = Get.put(
    UserController(),
    permanent: true,
  );
  //CartController cartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Cart'),
      ),
      body: Obx(
        () => cartController.cart.value.items.length == 0
            ? Center(
                child: Text('No items in cart'),
              )
            : ListView.builder(
                itemCount: cartController.cart.value.items.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(cartController.cart.value.items[index].id),
                    onDismissed: (direction) {
                      setState(() {
                        cartController
                            .removeItem(cartController.cart.value.items[index]);
                      });
                    },
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text(
                          'Remove',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          cartController.cart.value.items[index].image
                              .toString(),
                        ),
                      ),
                      title: Text(cartController.cart.value.items[index].title),
                      subtitle: Text(
                          '${cartController.cart.value.items[index].quantity} x ${cartController.cart.value.items[index].price}'),
                      trailing: Text(
                          '${cartController.cart.value.items[index].quantity * cartController.cart.value.items[index].price}'),
                      onLongPress: () {
                        cartController
                            .removeItem(cartController.cart.value.items[index]);
                      },
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: Obx(
        () => cartController.cart.value.items.length == 0
            ? Container()
            : Container(
                color: primaryColor.withOpacity(0.3),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total: \$${cartController.totalPrice}',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    RaisedButton(
                      color: primaryColor,
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Order order = Order();
                        // order.customerId =
                        //     userController.activeUser.value.email.toString();
                        // var details = Tblorderdetails();

                        // cartController.cart.forEach((element) {
                        //   // orderId: order.orderId as int,
                        //   details.menuId = 1;
                        //   //element.id as int,
                        //   details.amount = element.quantity as int;
                        //   detailstotalAmount:
                        //   element.price;
                        // });
                        // order.tblorderdetails!.add(details);

                        // order.totalAmount = 100;
                        // // cartController.totalPrice.value as int;
                        // order.orderStatus = 0;
                        // //    cartController.clearCart();

                        Get.to(CheckoutPage(cart: cartController.cart.value));
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
