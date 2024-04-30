
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: appBarThemeLight(),
  );
}

AppBarTheme appBarThemeLight() => const AppBarTheme(
  color: Colors.white,
  elevation: 0.0,
  centerTitle: true,
  iconTheme: IconThemeData(color: Color(0xFF8B8B8B)),
  titleTextStyle: TextStyle(color: Color(0xFF8B8B8B), fontSize: 18.0),
);