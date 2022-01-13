import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/constants/colors.dart';
import 'package:food_ordering_flutter/controller/menu_types_controller.dart';
import 'package:get/get.dart';

class MenuTypeComp extends StatefulWidget {
  const MenuTypeComp({Key? key}) : super(key: key);

  @override
  _MenuTypeCompState createState() => _MenuTypeCompState();
}

class _MenuTypeCompState extends State<MenuTypeComp> {
  @override
  Widget build(BuildContext contex) {
    final menuTypeController = Get.put(MenuTypesController());

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: 60,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          child: Obx(() {
            // print(categoriesController.categories);
            return menuTypeController.loading == false
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuTypeController.menuTypes.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          menuTypeController.selectedIndex = index;
                          print(menuTypeController.selectedIndex);
                          // categoriesController.categories[index];
                        });
                      },
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 130,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: menuTypeController.selectedIndex == index
                                    ? secondaryColor
                                    : secondaryColor.withOpacity(0.8),
                              ),
                              child: Center(
                                child: Text(
                                  menuTypeController.menuTypes[index].typeName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: menuTypeController.selectedIndex ==
                                              index
                                          ? Colors.white
                                          : Colors.white70),
                                ),
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
    );
  }
}
