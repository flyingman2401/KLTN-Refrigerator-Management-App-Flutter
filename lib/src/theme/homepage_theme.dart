import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get customLightTheme {
    return ThemeData( //2
      primaryColor: Colors.deepPurple[300],
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Montserrat',
      buttonTheme: ButtonThemeData( // 4
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.lightBlue,
      ),
      textTheme: TextTheme(
        titleLarge: const TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        labelLarge: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        labelMedium: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        labelSmall: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
        displayLarge: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        displayMedium: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        displaySmall: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.white
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black.withOpacity(0.8)
        )
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        indicatorColor: Colors.black,
      ),
    );
  }
}