import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor =const Color(0xffe2e2ff);
  static Color mainColor =const Color(0xff000633);
  static Color accentColor =const Color(0xff0065ff);

  static List<Color> cardsColor = [
    Colors.pink.shade100,
    Colors.red.shade100,
    Colors.orange.shade100,
    Colors.cyan.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
    Colors.deepPurple.shade100,
    Colors.indigo.shade100
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 21, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.roboto(fontSize: 19, fontWeight: FontWeight.normal);
  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);
}
