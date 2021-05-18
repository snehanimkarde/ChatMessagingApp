import 'package:chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: kContentColorLightTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: kContentColorLightTheme),
      colorScheme: ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: kContentColorLightTheme.withOpacity(0.7),
          unselectedItemColor: kContentColorLightTheme.withOpacity(0.32),
          selectedIconTheme: IconThemeData(color: kPrimaryColor)));
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: kContentColorLightTheme,
      appBarTheme: appBarTheme,
      iconTheme: IconThemeData(color: kContentColorDarkTheme),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
          .apply(bodyColor: Colors.red),
      colorScheme: ColorScheme.dark().copyWith(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: kErrorColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kContentColorDarkTheme,
          selectedItemColor: Colors.white70,
          unselectedItemColor: kContentColorDarkTheme.withOpacity(0.32),
          selectedIconTheme: IconThemeData(color: kPrimaryColor)));
}

final appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);
