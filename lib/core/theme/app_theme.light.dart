import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,

  colorScheme: ColorScheme.light(

    // My brand color
    primary: HSLColor.fromAHSL(1.0, 35, 0.8, 0.45).toColor(),
    onPrimary: HSLColor.fromAHSL(1.0, 0, 0, 0.10).toColor(),

    // Surface colors neutral on top of scaffold
    surface: HSLColor.fromAHSL(1.0, 0, 0, 0.88).toColor(),  // Surface color
    onSurface: HSLColor.fromAHSL(1.0, 0, 0, 0.05).toColor(), // Surface text color

    // Secondary colors neutral
    secondary: HSLColor.fromAHSL(1.0, 0, 0, 0.82).toColor(),
    onSecondary: HSLColor.fromAHSL(1.0, 0, 0, 0.15).toColor(),

    // Tertiary colors neutral
    tertiary: HSLColor.fromAHSL(1.0, 0, 0, 0.78).toColor(),
    onTertiary: HSLColor.fromAHSL(1.0, 0, 0, 0.15).toColor(),

    // Error colors
    error: HSLColor.fromAHSL(1.0, 0, 0.7, 0.50).toColor(),
    onError: HSLColor.fromAHSL(1.0, 0, 0, 0.90).toColor(),

    // Constrasts and effects
    outline: HSLColor.fromAHSL(1.0, 0, 0, 0.65).toColor(),
    inverseSurface: HSLColor.fromAHSL(1.0, 0, 0, 0.12).toColor(),
    onInverseSurface: HSLColor.fromAHSL(1.0, 0, 0, 0.95).toColor(),
    inversePrimary: HSLColor.fromAHSL(1.0, 35, 0.8, 0.65).toColor(),
    shadow: HSLColor.fromAHSL(0.6, 0, 0, 1).toColor(), // lettere skygge
    surfaceTint: HSLColor.fromAHSL(1.0, 35, 0.8, 0.45).toColor(),

  ),

  // Appbar colors
  appBarTheme: AppBarTheme(
    backgroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.88).toColor(),
    foregroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.05).toColor(),
    elevation: 0,
  ),

  // Bottom navigation bar colors
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.88).toColor(),
    selectedItemColor: HSLColor.fromAHSL(1.0, 35, 0.8, 0.45).toColor(),
    unselectedItemColor: HSLColor.fromAHSL(1.0, 0, 0, 0.05).toColor(),
    type: BottomNavigationBarType.fixed,
  ),

  // Scaffold color
  scaffoldBackgroundColor: HSLColor.fromAHSL(1.0, 0, 0, 0.92).toColor(),
);

