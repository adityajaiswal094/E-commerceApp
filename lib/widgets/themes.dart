import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyThemes {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: cream,
      buttonColor: darkBlue,
      accentColor: darkBlue,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkColor,
      buttonColor: lightBluishColor,
      accentColor: Colors.cyan[50],
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline6: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.white))));

  //Colors
  static Color cream = Color(0xfff5f5f5);
  static Color darkColor = Vx.gray900;
  static Color darkBlue = Color(0xff403b58);
  static Color lightBluishColor = Color(0xFF7E57C2);
}
