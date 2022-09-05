import 'package:flutter/material.dart';

abstract class Styles {
  static const audioTileSubTextColor = Color.fromRGBO(170, 170, 170, 1);
  static const titleColor = Colors.white;
  static const primaryColor = Colors.amber;

  static const TextStyle appBarTitleTS = TextStyle(
      color: Styles.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');
  static const TextStyle body1TS = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');

  static const TextStyle buttonTS = TextStyle(
      color: Styles.titleColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');

  static const TextStyle label1TS = TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');
  static const TextStyle cardTS = TextStyle(
      color: Colors.amber,
      fontSize: 20,
      fontWeight: FontWeight.w500,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');
  static const TextStyle cardSubtitleTS = TextStyle(
      color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');
  static const TextStyle cardBigTS = TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
      fontFamily: 'Poppins');
}
