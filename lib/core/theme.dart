import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Primary colors
  static const Color primaryBlue = Color(0xFF4299E1);
  static const Color primaryDark = Color(0xFF2D3748);
  static const Color navyBlue = Color(0xFF1A365D);
  
  // Text colors
  static const Color darkText = Color(0xFF2D3748);
  static const Color grayText = Color(0xFF718096);
  
  // Status colors
  static const Color green = Color(0xFF48BB78);
  static const Color red = Color(0xFFF56565);
  static const Color yellow = Color(0xFFF6AD55);
  
  // Background colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF7FAFC);
  static const Color mediumGray = Color(0xFFE2E8F0);
  static const Color cardBlue = Color(0xFFEBF4FF);
  
  // Border colors
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color borderMedium = Color(0xFFCBD5E0);
  static const Color borderBlue = Color(0xFFC3DAFE);
  
  // Table specific
  static const Color tableHeaderBg = Color(0xFFF7FAFC);
  
  // Create the ThemeData
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryBlue,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: white,
      colorScheme: ColorScheme.light(
        primary: primaryBlue,
        secondary: navyBlue,
        onPrimary: white,
        onSecondary: white,
        surface: white,
        background: white,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: darkText,
        ),
        displayMedium: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: darkText,
        ),
        titleLarge: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: darkText,
        ),
        titleMedium: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: darkText,
        ),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 14,
          color: darkText,
        ),
        bodyMedium: GoogleFonts.roboto(
          fontSize: 12,
          color: grayText,
        ),
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        color: borderLight,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderMedium),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: borderMedium),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryBlue),
        ),
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: borderLight),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        elevation: 0,
        iconTheme: IconThemeData(color: darkText),
        titleTextStyle: TextStyle(
          color: darkText,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
