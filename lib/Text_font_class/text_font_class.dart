import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFont{
  static TextStyle get normal_TextStyle => GoogleFonts.montserrat();
  ///app bar font
  static TextStyle get bold_TextStyle => GoogleFonts.montserrat(fontWeight: FontWeight.bold);

}