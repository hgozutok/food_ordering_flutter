import 'package:flutter/material.dart';

class Constants {
  //urls for pages
  static const String baseUrl = 'https://localhost:5001';
  static const String products = baseUrl + '/products';
  static const String categories = baseUrl + '/products/categories';
  static const String login = baseUrl + '/api/user/token';
//menu urls
  static const String menuTypes = baseUrl + '/api/tblmenutypes';
  static const String menus = baseUrl + '/api/tblmenus';
  static const String registerUser = baseUrl + '/api/user/register';
}
