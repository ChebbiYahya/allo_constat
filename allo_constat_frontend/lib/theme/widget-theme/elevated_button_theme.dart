import 'package:flutter/material.dart';
import '../constants.dart';

class TElavatedButtonTheme {
  TElavatedButtonTheme._();

  static final smallElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      foregroundColor: kWhiteColor,
      backgroundColor: kGreenColor,
      side: const BorderSide(style: BorderStyle.none),
      minimumSize: const Size(double.infinity, 50),
      padding: const EdgeInsets.symmetric(vertical: 5),
    ),
  );
}
