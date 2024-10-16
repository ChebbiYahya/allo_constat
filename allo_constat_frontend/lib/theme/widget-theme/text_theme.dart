import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class TTextTheme {
  // Mobile
  static TextTheme mobileTextTheme = TextTheme(
    displayLarge: GoogleFonts.quicksand(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    displayMedium: GoogleFonts.quicksand(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    displaySmall: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    headlineMedium: GoogleFonts.quicksand(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: kDarkBlueColor,
    ),
    headlineSmall: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: kDarkBlueColor,
    ),
    titleLarge: GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: kDarkBlueColor,
    ),
    bodyLarge: GoogleFonts.quicksand(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: kDarkBlueColor,
    ),
    bodyMedium: GoogleFonts.quicksand(
      fontSize: 11,
      fontWeight: FontWeight.normal,
      color: kDarkBlueColor.withOpacity(0.7),
    ),
  );
}
