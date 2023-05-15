import 'package:flutter/material.dart';

class CritiqoTheme {
  static TextTheme lightTextTheme = const TextTheme(
      bodySmall: TextStyle(
        fontFamily: 'NotosansKR',
        fontSize: 8,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
          fontFamily: 'NotosansKR', fontSize: 18, fontWeight: FontWeight.w300),
      bodyLarge: TextStyle(
          fontFamily: 'NotosansKR', fontSize: 23, fontWeight: FontWeight.w300),
      displaySmall: TextStyle(
          fontFamily: 'NotosansKR', fontSize: 25, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(
          fontFamily: 'NotosansKR', fontSize: 20, fontWeight: FontWeight.w500),
      displayLarge: TextStyle(
          fontFamily: 'NotosansKR', fontSize: 30, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontFamily: 'NotosansKR', fontSize: 35, fontWeight: FontWeight.w700),
      titleMedium: TextStyle(fontFamily: 'NotosansKR', fontSize: 32, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(fontFamily: 'NotosansKR', fontSize: 38, fontWeight: FontWeight.w700)
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodySmall: TextStyle(fontFamily: 'NotosansKR', fontSize: 8),
    bodyMedium: TextStyle(fontFamily: 'NotosansKR', fontSize: 12),
    displayLarge: TextStyle(fontFamily: 'NotosansKR', fontSize: 25),
    displaySmall: TextStyle(fontFamily: 'NotosansKR', fontSize: 18),
    titleLarge: TextStyle(fontFamily: 'NotosansKR', fontSize: 23),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          return Colors.black;
        }),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: darkTextTheme,
    );
  }
}
