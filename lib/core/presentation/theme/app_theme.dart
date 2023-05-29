import 'package:article_hub/core/presentation/theme/colours.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      scaffoldBackgroundColor: backgroundLight,
      primaryColor: primaryColor1,
      iconTheme: IconThemeData(color: primaryColor1),
      textTheme: appTextTheme,
    );
  }
}

TextTheme appTextTheme = TextTheme(
  displayLarge: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: primaryBlack,
  ),
  displayMedium: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryBlack,
  ),
  displaySmall: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: primaryBlack,
  ),
  bodyLarge:TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: primaryBlack,
  ),
  bodyMedium: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: primaryBlack,
  ),
  bodySmall: TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: primaryBlack,
  ),
);
