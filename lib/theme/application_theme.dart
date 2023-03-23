import 'package:flutter/material.dart';
import 'colors.dart';

class HayaathTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Pallete.backgroundColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Pallete.backgroundColor,
    ),
  );
}
