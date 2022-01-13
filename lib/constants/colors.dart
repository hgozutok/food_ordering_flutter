import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

// 0xFF

const Color backgroundColor = Color(0xFFF5F5F5);
const Color primaryColor = Color(0xFFad1357);
const Color secondaryColor = Color(0xFF6a1b9a);
const Color accentColor = Color(0xFF42A5F5);
const Color errorColor = Color(0xFFB71C1C);
const Color successColor = Color(0xFF388E3C);
const Color warningColor = Color(0xFFF57C00);
const Color infoColor = Color(0xFF00BCD4);
const Color darkColor = Color(0xFF263238);
const Color lightColor = Color(0xFF546E7A);
const Color greyColor = Color(0xFF9E9E9E);
const Color greyDarkColor = Color(0xFF212121);
const Color textColor = Color(0xFF000000);
const Color textLightColor = Color(0xFF757575);
const Color textDarkColor = Color(0xFFffffff);
const Color dividerColor = Color(0xFFBDBDBD);
const Color iconColor = Color(0xFF757575);
const Color iconLightColor = Color(0xFFffffff);
const Color iconDarkColor = Color(0xFF757575);
const Color iconSelectedColor = Color(0xFFffffff);
const Color iconSelectedLightColor = Color(0xFFffffff);
const Color iconSelectedDarkColor = Color(0xFF757575);
const Color iconDisabledColor = Color(0xFFBDBDBD);
const Color backgroundColorLight = Color(0xFFF5F5F5);
