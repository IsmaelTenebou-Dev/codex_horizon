import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NFTTheme {
  // Primary background colors - matching dashboard theme
  static const Color primaryBackground = Color(0xFF111C44); // Updated to match dashboard
  static const Color secondaryBackground = Color(0xFF1B254B); // Updated to match dashboard's secondary color
  static const Color cardBackground = Color(0xFF1B254B); // Updated to match dashboard's card background
  static const Color darkBlue = Color(0xFF192555);
  
  // Accent colors - matching dashboard theme
  static const Color primaryBlue = Color(0xFF4318FF); // Updated to match dashboard primary blue
  static const Color purple = Color(0xFF7551FF); // Updated to match dashboard purple
  static const Color teal = Color(0xFF6AD2FF); // Updated to match dashboard teal
  
  // Text colors
  static const Color whiteText = Colors.white;
  static const Color greyText = Colors.grey;
  
  // Button styles
  static ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 132, 147, 160),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  );
  
  static ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
    side: const BorderSide(color: whiteText),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  );
  
  static ButtonStyle smallButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryBlue,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    minimumSize: const Size(0, 32),
  );
  
  // Text styles
  static TextStyle headingStyle = const TextStyle(
    color: whiteText,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle subheadingStyle = const TextStyle(
    color: whiteText,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle titleStyle = const TextStyle(
    color: whiteText,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  
  static TextStyle bodyStyle = const TextStyle(
    color: whiteText,
    fontSize: 14,
  );
  
  static TextStyle smallBodyStyle = const TextStyle(
    color: greyText,
    fontSize: 12,
  );
  
  // Container decorations
  static BoxDecoration cardDecoration = BoxDecoration(
    color: cardBackground,
    borderRadius: BorderRadius.circular(16),
  );
  
  static BoxDecoration iconButtonDecoration = BoxDecoration(
    color: darkBlue,
    borderRadius: BorderRadius.circular(18),
  );
  
  // Create a complete theme
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryBlue,
      scaffoldBackgroundColor: primaryBackground,
      cardColor: cardBackground,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlue,
        secondary: purple,
        tertiary: teal,
        background: primaryBackground,
        surface: secondaryBackground,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.dark().textTheme,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: primaryButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: secondaryBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(color: greyText),
      ),
    );
  }
}
