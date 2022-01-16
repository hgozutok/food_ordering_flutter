import 'package:food_ordering_flutter/models/menu.dart';
import 'package:food_ordering_flutter/pages/cart_page.dart';
import 'package:food_ordering_flutter/pages/detail_page.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String search = '/search';
  static const String category = '/category';
  static const String categoryList = '/category-list';
  static const String productList = '/product-list';
  static const String product = '/product';
  static const String cart = '/cart';
  static const String order = '/order';
  static const String orderList = '/order-list';
  static const String orderDetail = '/order-detail';
  static const String addressList = '/address-list';
  static const String address = '/address';
  static const String payment = '/payment';
  static const String paymentMethod = '/payment-method';
  static const String paymentSuccess = '/payment-success';
  static const String about = '/about';
  static const String policy = '/policy';
  static const String contact = '/contact';
  static const String faq = '/faq';
  static const String menus = '/menus';
  static const String menu = '/menu-detail';
  static const String menuTypes = '/menu-types';

  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: '/', page: () => HomePage()),
    GetPage(name: '/cart', page: () => CartPage()),
    // GetPage(name: '/order', page: () => OrderPage()),
    // GetPage(name: '/order-list', page: () => OrderListPage()),
    // GetPage(name: '/order-detail', page: () => OrderDetailPage()),
    // GetPage(name: '/address-list', page: () => AddressListPage()),
    // GetPage(name: '/address', page: () => AddressPage()),
    // GetPage(name: '/payment', page: () => PaymentPage()),
    // GetPage(name: '/payment-method', page: () => PaymentMethodPage()),
    // GetPage(name: '/payment-success', page: () => PaymentSuccessPage()),
    // GetPage(name: '/about', page: () => AboutPage()),
    // GetPage(name: '/policy', page: () => PolicyPage()),
    // GetPage(name: '/contact', page: () => ContactPage()),
    // GetPage(name: '/faq', page: () => FaqPage()),
    GetPage(name: '/menus', page: () => HomePage()),
    // GetPage(name: '/menu-detail', page: () =>   DetailPage(),arguments:null ),
    // GetPage(name: '/menu-types', page: () => MenuTypes()),
    // GetPage(name: '/category', page: () => CategoryPage()),
    // GetPage(name: '/category-list', page: () => CategoryListPage()),
    // GetPage(name: '/product-list', page: () => ProductListPage()),
    // GetPage(name: '/product', page: () => ProductPage()),
    // GetPage(name: '/profile', page: () => ProfilePage()),
    // GetPage(name: '/settings', page: () => SettingsPage()),
    // GetPage(name: '/search', page: () => SearchPage()),
    // GetPage(name: '/login', page: () => LoginPage()),
    // GetPage(name: '/register', page: () => RegisterPage()),
    // GetPage(name: '/forgot-password', page: () => ForgotPasswordPage()),
    // GetPage(name: '/dashboard', page: () => DashboardPage()),
  ];
}
