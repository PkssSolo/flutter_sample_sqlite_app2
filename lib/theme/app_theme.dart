import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: const Color(0xFF121212),
  );
}