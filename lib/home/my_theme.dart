import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color darkColor = Color(0xFF242424);
  static const Color yellowColor = Color(0xFFFACC1D);
  static const Color secondaryColor = Color(0xFF141A2E);

  static ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          fontFamily: "ElMessiri",
          fontSize: 25,
          color: darkColor,
          fontWeight: FontWeight.bold),
      bodySmall: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: darkColor,
          fontWeight: FontWeight.w400),
      displaySmall: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: darkColor,
          fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: primaryColor,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: yellowColor,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: darkColor,
          fontWeight: FontWeight.w600),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: darkColor,
      unselectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: darkColor),
      elevation: 0,
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "ElMessiri"),
    ),
  );

  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter",
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: "ElMessiri",
        ),
        displaySmall: TextStyle(
            fontFamily: "Inter",
            fontSize: 25,
            color: yellowColor,
            fontWeight: FontWeight.w600),
      displayMedium: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: darkColor,
          fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
          fontFamily: "Inter",
          fontSize: 25,
          color: yellowColor,
          fontWeight: FontWeight.w600),
      titleMedium: TextStyle(
        fontFamily: "Inter",
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.w600),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: secondaryColor,
      selectedItemColor: yellowColor,
      unselectedItemColor: Colors.white,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "ElMessiri"),
    ),
  );
}
