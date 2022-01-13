import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/constants/colors.dart';
import 'package:food_ordering_flutter/constants/constants.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Restaurant',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            Text(
              'Description',
              style: TextStyle(fontSize: 20, color: primaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
                Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.yellow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
