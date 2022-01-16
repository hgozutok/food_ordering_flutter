import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/constants/colors.dart';
import 'package:food_ordering_flutter/controller/cart_controller.dart';
import 'package:food_ordering_flutter/models/cart.dart';
import 'package:food_ordering_flutter/models/menu.dart';
import 'package:food_ordering_flutter/models/routes.dart';
import 'package:food_ordering_flutter/pages/cart_page.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  // final Menu menu;

  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    CartController cartController = Get.put(
      CartController(),
      permanent: true,
    );
    DetailController detailController = Get.put(DetailController());
    Menu menu = Get.arguments as Menu;
    //Cart cart = Get.put(Cart());
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
              //Get.offAll(CartPage());
              //Get.toNamed(Routes.cart);
              Get.to(CartPage());
            },
          ),
        ],
      ),
      body: Container(
        color: secondaryColor,
        // height: 250,
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: 200,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 10,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 25),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(menu.menuImage.toString()),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.circular(50),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: Offset(-1, 10),
                      blurRadius: 10,
                      //
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              // height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.only(top: 200),
              child: Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Text(
                      menu.menuName.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${menu.price}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                if (detailController.quantity.value > 1) {
                                  setState(() {
                                    detailController.quantity.value--;
                                  });
                                }
                              },
                              icon: Icon(Icons.remove),
                              color: Colors.white,
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              child: Text(
                                detailController.quantity.toString(),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // if (itemCount < 10) {
                                setState(() {
                                  detailController.quantity.value++;
                                });
                              },
                              icon: Icon(Icons.add),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      // height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: secondaryColor,
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            cartController.addItem(
                              menu.menuId.toString(),
                              menu.price as double,
                              menu.menuName.toString(),
                              detailController.quantity.value,
                              menu.menuImage.toString(),
                            );

                            Get.snackbar(
                              "Added to cart",
                              "Item added to cart",
                              duration: Duration(seconds: 3),
                              mainButton: TextButton(
                                onPressed: () {
                                  Get.to(CartPage());
                                },
                                child: Text("Go to cart",
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                              ),
                            );
                          },
                          child: Text(
                            'Add to Cart',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              backgroundColor: secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 335),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Ingredigents',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    menu.ingredients.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailController extends GetxController {
  var quantity = 1.obs;
  var total = 0.obs;
  Rx<Menu> menu = Menu().obs;
}
