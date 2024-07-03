import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ApplicationTheme {
  static bool isDark=true;
  static Color PrimaryColor = Color(0xff5D9CEC);
  static ThemeData LightTheme=ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: Color(0xffdfecdb),
    colorScheme: ColorScheme.fromSeed(
      primary: Color(0xffB7935F),
      seedColor: PrimaryColor,
      onSecondary: Color(0xff242424),
      onPrimary:  PrimaryColor,
      background: Colors.white,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: PrimaryColor,
        centerTitle: false,
        toolbarHeight: 80,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        color: PrimaryColor,
      ),
      selectedItemColor: PrimaryColor,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey.shade700,
      ),
      unselectedItemColor: Colors.grey.shade700,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color:Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: PrimaryColor,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    cardTheme: CardTheme(
      color: PrimaryColor,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
    ),
  );
  static ThemeData DarkTheme=ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: Color(0xff141a2e),
    colorScheme: ColorScheme.fromSeed(
      primary: Color(0xff141a2e),
      seedColor: Color(0xff141a2e),
      onSecondary: Color(0xfffacc1d),
      onPrimary: Color(0xfffacc1d),
      onBackground: Color(0xff141a2e),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
        backgroundColor: Colors.transparent,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      centerTitle: true,
      elevation: 0,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:Color(0xff141a2e),
      type:BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        size: 32,
        color: Color(0xfffacc1d),
      ),
      selectedItemColor: Color(0xfffacc1d),
      unselectedIconTheme: IconThemeData(
        size: 26,
        color: Colors.white,
      ),
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 25,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.white,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xff141a2e).withOpacity(0.9),
    ),
    dividerColor: Color(0xfffacc1d),

  );
}