import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      labelStyle: const TextStyle(fontSize: 18.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ));
}
