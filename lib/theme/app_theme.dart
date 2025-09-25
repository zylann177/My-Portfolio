import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const lightGradient = LinearGradient(
    colors: const [Color(0xFFFDE8F5), Color(0xFFE7F3FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const darkGradient = LinearGradient(
    colors: const [Color(0xFF1B1026), Color(0xFF2A1B36)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color accentPink = Color(0xFFDB2B8B);
  static const Color accentPurple = Color(0xFF8A4FFF);
  static const Color accentTeal = Color(0xFF26C6DA);
  static const Color cardLight = Color(0xFFF6F3FF);
  static const Color cardDark = Color(0xFF24172B);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF7F6FB),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: const Color(0xFF151515),
      displayColor: const Color(0xFF151515),
    ),
    colorScheme: const ColorScheme.light(
      primary: accentPurple,
      secondary: accentTeal,
      surface: Color(0xFFF7F6FB),
      onPrimary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white.withOpacity(0.6),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black87),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
    cardColor: cardLight,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: accentPurple),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF0D0B10),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(
      primary: accentPurple,
      secondary: accentTeal,
      background: Color(0xFF0D0B10),
      onPrimary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black.withOpacity(0.25),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardColor: cardDark,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: accentPurple),
  );
}
