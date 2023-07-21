import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle light({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle normal({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle bold({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }

  static TextStyle extraBold({
    double fontSize = 12,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.normal,
      fontSize: fontSize,
      decoration: decoration,
    );
  }
}
