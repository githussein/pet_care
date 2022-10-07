import 'package:flutter/material.dart';
import './font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

//regular text style
TextStyle getRegularStyle({double fontSize = FontSize.s12, required color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.regular,
    color,
  );
}

//light text style
TextStyle getLightStyle({double fontSize = FontSize.s12, required color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.light,
    color,
  );
}

//italic text style
TextStyle getItalicStyle({double fontSize = FontSize.s12, required color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.italic,
    color,
  );
}

//medium text style
TextStyle getMediumStyle({double fontSize = FontSize.s12, required color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.medium,
    color,
  );
}

//bold text style
TextStyle getBoldStyle({double fontSize = FontSize.s12, required color}) {
  return _getTextStyle(
    fontSize,
    FontConstant.fontFamily,
    FontWeightManager.bold,
    color,
  );
}
