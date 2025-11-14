import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  brightness: Brightness.dark,

  colorScheme: ColorScheme.dark(

    // My brand color
    primary: HSLColor.fromAHSL(1.0, 35, 0.8, 0.60).toColor(),
    onPrimary: HSLColor.fromAHSL(1.0, 0, 0, 0.10).toColor(),

    // Surface colors neutral on top of scaffold
    surface: HSLColor.fromAHSL(1.0, 0, 0, 0.08).toColor(),  // Surface color
    onSurface: HSLColor.fromAHSL(1.0, 0, 0, 0.95).toColor(), // Surface text color

    // Secondary colors neutral
    secondary: HSLColor.fromAHSL(1.0, 0, 0, 0.18).toColor(),
    onSecondary: HSLColor.fromAHSL(1.0, 0, 0, 0.85).toColor(),

    // Tertiary colors neutral
    tertiary: HSLColor.fromAHSL(1.0, 0, 0, 0.22).toColor(),
    onTertiary: HSLColor.fromAHSL(1.0, 0, 0, 0.85).toColor(),

    // Error colors
    error: HSLColor.fromAHSL(1.0, 0, 0.7, 0.50).toColor(),
    onError: HSLColor.fromAHSL(1.0, 0, 0, 0.90).toColor(),

    // Constrasts and effects
    outline: HSLColor.fromAHSL(1.0, 0, 0, 0.35).toColor(),
    inverseSurface: HSLColor.fromAHSL(1.0, 0, 0, 0.88).toColor(),
    onInverseSurface: HSLColor.fromAHSL(1.0, 0, 0, 0.05).toColor(),
    inversePrimary: HSLColor.fromAHSL(1.0, 35, 0.8, 0.75).toColor(),
    shadow: HSLColor.fromAHSL(0.6, 0, 0, 0.00).toColor(), // lettere skygge
    surfaceTint: HSLColor.fromAHSL(1.0, 35, 0.8, 0.60).toColor(),

  ),

  // Appbar colors
  appBarTheme: AppBarTheme(
    backgroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.08).toColor(),
    foregroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.95).toColor(),
    elevation: 0,
  ),

  // Bottom navigation bar colors
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.08).toColor(),
    selectedItemColor: HSLColor.fromAHSL(1.0, 35, 0.8, 0.60).toColor(),
    unselectedItemColor: HSLColor.fromAHSL(1.0, 0, 0, 0.95).toColor(),
    type: BottomNavigationBarType.fixed,
  ),

  // Scaffold color
  scaffoldBackgroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.12).toColor(),
);


