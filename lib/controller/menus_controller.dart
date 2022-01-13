import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/models/menu.dart';

import 'package:food_ordering_flutter/services/remote_services.dart';

import 'package:get/get.dart';

class MenusController extends GetxController {
  List<dynamic> menus = [].obs;

  late Future<String> pname;
  ScrollController controller = ScrollController();
  PageController pageController = PageController();
  late var _loading = false.obs;
  late int selectedIndex = 0;
  final int _perPage = 10;
  late int _xPage = 1;
  get loading => _loading.value;
  String? category;
  // final int _page = 1;
  // int get page {
  //   return _page;
  // }

  // set page(int value) {
  //   page = value;
  // }

  @override
  void onInit() {
    controller.addListener((pagination));
    getMenuList();
    // _loadData(_xPage, _perPage, category);

    super.onInit();
  }

  @override
  void onDispose() {
    controller.dispose();
  }

  void pagination() {
    if ((controller.position.pixels == controller.position.maxScrollExtent)) {
      _loading.value = true;
      // NextPage();
      //  print(controller.position.pixels.toString());
      //add api for load the more data according to new page

    } else if ((controller.position.pixels ==
        controller.position.minScrollExtent)) {
      _loading.value = true;
      // PreviousPage();
      //  print(controller.position.pixels.toString());
      //add api for load the more data according to new page

    }
  }

  Future<List<Menu>> getMenuList() async {
    _loading.value = true;
    var menuL = await RemoteService.getMenus();
    print("menuLists");
    print(menuL!);
    if (menuL != null) {
      menus = menuL;
    }
    print("menus");
    print(menus);

    _loading.value = false;

    return menuL;
  }
}
