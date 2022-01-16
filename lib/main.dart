import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ordering_flutter/constants/colors.dart';

import 'package:food_ordering_flutter/models/routes.dart';
import 'package:food_ordering_flutter/pages/cart_page.dart';
import 'package:food_ordering_flutter/pages/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.home,
      getPages: Routes.getPages,
      title: 'Food Ordering',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Food Ordering App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    // final Color background = Colors.grey;
    // final Color fill = Colors.redAccent;
    // final List<Color> gradient = [
    //   background,
    //   background,
    //   fill,
    //   fill,
    // ];
    // final double fillPercent = 56.23; // fills 56.23% for container from bottom
    // final double fillStop = (100 - fillPercent) / 100;
    // final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      theme: ThemeData(
        primarySwatch: colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(245, 179, 66, 245),
                Color.fromARGB(245, 120, 66, 245),
                Color.fromARGB(245, 161, 66, 245),
                Color.fromARGB(245, 66, 111, 245),
              ],
              stops: [0.0, 0.0, 0.0, 0.0],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/intro.png',
                  height: 250,
                  width: 300,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () {
                      Get.to(HomePage());
                    },
                    child: const Text('ORDER NOW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
