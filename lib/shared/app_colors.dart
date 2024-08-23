import 'package:flutter/material.dart';

class AppColors {
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color primary = Color(0xff0033A0);
  static const Color secondary = Color(0xff333333);
  static const Color red = Color(0xffFB7181);
  static const Color lightBlue = Color(0xff40BFFF);
  static const Color green = Color(0xff53D1B6);
  static const Color orange = Color(0xffFFC833);
  static const Color grey = Color(0xff9098B1);
  static const Color greyBackground = Color(0xFFD9D9D9);
  static List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 4,
      offset: const Offset(
        0,
        1,
      ),
      spreadRadius: 0,
    ),
  ];
}
