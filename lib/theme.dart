import 'package:flutter/material.dart';

const kSnapVBlue700 = const Color(0xFF002BEA);
const kSnapVBlue500 = const Color(0xFF4837FA);
const kSnapVBlue900 = const Color(0xFF0018DE);

const kSnapVOrange400 = const Color(0xFFEABF00);
const kSnapVOrange600 = const Color(0xFFE9A700);

final ThemeData kSnapVTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kSnapVBlue900,
    bottomAppBarColor: Colors.white,
    buttonColor: kSnapVBlue900,
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      textTheme: ButtonTextTheme.primary,
    ),
    primaryColor: kSnapVBlue700,
    primaryColorLight: kSnapVBlue500,
    primaryColorDark: kSnapVBlue900,
    iconTheme: IconThemeData(color: kSnapVBlue900),
    accentIconTheme: IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      helperStyle: new TextStyle(color: Colors.blue),
    ),
  );
}
