import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/constants/colors.dart';
import 'package:food_ordering_flutter/controller/menus_controller.dart';
import 'package:food_ordering_flutter/pages/detail_page.dart';
import 'package:get/get.dart';

class Menus extends StatefulWidget {
  const Menus({Key? key}) : super(key: key);

  @override
  _MenusState createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  @override
  Widget build(BuildContext context) {
    final menusController = Get.put(MenusController());

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 300,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: Obx(() {
              // print(categoriesController.categories);
              return menusController.loading == false
                  ? ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: menusController.menus.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            menusController.selectedIndex = index;
                            print(menusController.selectedIndex);
                            // categoriesController.categories[index];
                          });
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                // width: 130,
                                // height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // color: menusController.selectedIndex == index
                                  //     ? secondaryColor
                                  //     : secondaryColor.withOpacity(0.5),
                                ),
                                child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        menusController.menus[index].menuImage,
                                        height: 120,
                                        width: 120,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            menusController
                                                .menus[index].menuName,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: secondaryColor,
                                            ),
                                          ),
                                          Text(
                                            menusController.menus[index]
                                                        .ingredients !=
                                                    null
                                                ? menusController
                                                    .menus[index].ingredients
                                                    .toString()
                                                : ' ',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: secondaryColor
                                                  .withOpacity(0.5),
                                              //     menusController.selectedIndex == index
                                              //         ? Colors.white
                                              //         : Colors.white70
                                            ),
                                          ),
                                          Text(
                                            "\$" +
                                                menusController
                                                    .menus[index].price
                                                    .toString(),
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: secondaryColor
                                                  .withOpacity(0.8),
                                              //     menusController.selectedIndex == index
                                              //         ? Colors.white
                                              //         : Colors.white70
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(Icons.arrow_forward_ios,
                                      color: secondaryColor),
                                  onTap: () {
                                    setState(() {
                                      menusController.selectedIndex = index;
                                      Get.to(DetailPage(
                                          menu: menusController.menus[index]));
                                      // categoriesController.categories[index];
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
