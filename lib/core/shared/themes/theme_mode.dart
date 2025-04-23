import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData getDarkMode()=>ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: HexColor('#1B2529'),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontFamily: 'jannah',
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
      size: 25.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('#1B2529'),
    ),
  ),
  scaffoldBackgroundColor: HexColor('#1B2529'),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.deepOrange,
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('#1B2529'),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    titleLarge: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    titleMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    bodyMedium: TextStyle(
      color: Colors.grey,
      fontFamily: 'jannah',
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.deepOrange,
  ),
);

ThemeData getLightMode()=>ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: 'jannah',
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
      size: 25.0,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.blue,
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'jannah',
    ),
    bodyMedium: TextStyle(
      color: Colors.grey,
      fontFamily: 'jannah',
    ),
  ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.blue,
    )
);