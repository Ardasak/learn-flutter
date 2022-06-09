import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const primaryColor = Colors.indigo;
  static const String titleText = "Calculate Average";
  static final TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );
  static final BorderRadius textFieldBorderRadius = BorderRadius.circular(16);

  static final TextStyle showAverageStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );
  static final TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: primaryColor,
  );

  static final dropDownPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final paddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
}
