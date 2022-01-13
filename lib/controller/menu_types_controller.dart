import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/models/menu_type.dart';
import 'package:food_ordering_flutter/services/remote_services.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MenuTypesController extends GetxController {
  List<dynamic> menuTypes = [].obs;

  late Future<String> pname;
  ScrollController controller = ScrollController();
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
    getMenuTypeList();
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

  Future<List<MenuType>> getMenuTypeList() async {
    _loading.value = true;
    var menuTypeList = await RemoteService.getMenuTypes();
    print(menuTypeList![1].typeName);
    if (menuTypeList != null) {
      menuTypes = menuTypeList;
    }

    _loading.value = false;

    return menuTypeList;
  }
}
