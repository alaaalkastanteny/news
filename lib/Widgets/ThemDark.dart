// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkThem = ThemeData(
  appBarTheme: AppBarTheme(
    iconTheme: const IconThemeData(color: Colors.white),
    backgroundColor: HexColor('333739'),
    elevation: 0,
    // systemOverlayStyle: SystemUiOverlayStyle(
    //     statusBarColor: HexColor('333739'),
    //     statusBarIconBrightness: Brightness.light),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
);
