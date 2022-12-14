import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#048c5c');
  static Color accent = HexColor.fromHex('#b3d0d3');
  static Color primaryDark = HexColor.fromHex('#243424');

  static Color action = HexColor.fromHex('#06cc7d');
  static Color grey = HexColor.fromHex('#707070');
  static Color black = HexColor.fromHex('#101010');
  static Color white = HexColor.fromHex('#FFFFFF');
  static Color error = HexColor.fromHex('#e61f34');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", "");

    if (hexColorString.length == 6) {
      hexColorString = 'FF$hexColorString';
    }

    return Color(int.parse(hexColorString, radix: 16));
  }
}
