// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  static ThemeData lightTheme() {
    return ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.purple,
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }

  static Color cream = Color(0xfff5f5f5);
  static Color darlBlueish = Color(0xff403b58);
}
