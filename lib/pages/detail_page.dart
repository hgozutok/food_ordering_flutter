import 'package:flutter/material.dart';
import 'package:food_ordering_flutter/models/menu.dart';

class DetailPage extends StatefulWidget {
  final Menu menu;

  const DetailPage({Key? key, required this.menu}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Center(
        child: Text(widget.menu.menuName.toString()),
      ),
    );
  }
}
