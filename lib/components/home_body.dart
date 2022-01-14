import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/components/menu_types.dart';
import 'package:food_ordering_flutter/components/custom_app_bar.dart';
import 'package:food_ordering_flutter/components/menus.dart';
import 'package:food_ordering_flutter/components/restaurant.dart';
import 'package:food_ordering_flutter/constants/colors.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: backgroundColorLight,
      width: MediaQuery.of(context).size.width,
      //  height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(),
          SizedBox(height: 5),
          Restaurant(),
          SizedBox(height: 5),
          MenuTypeComp(),
          SizedBox(height: 5),
          Menus(),
        ],
      ),
    );
  }
}
