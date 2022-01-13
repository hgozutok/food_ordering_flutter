import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IconData leftIcon = Icons.arrow_back;
    final IconData rightIcon = Icons.search;
    final Function? leftCallback;

    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: IconButton(
              icon: Icon(leftIcon, color: Colors.white),
              onPressed: () {},
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(8, 8, 16, 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(rightIcon, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
