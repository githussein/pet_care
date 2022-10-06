import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex('#048c5c');
  static Color accent = HexColor.fromHex('#b3d0d3');
  static Color primaryDark = HexColor.fromHex('#243424');
  static Color action = HexColor.fromHex('#06cc7d');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString.replaceAll('#', '');

    if (hexColorString.length == 6) {
      hexColorString = 'FF + $hexColorString';
    }

    return Color(int.parse(hexColorString));
  }
}
