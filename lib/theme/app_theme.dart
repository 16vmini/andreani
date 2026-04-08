import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Andreani Brand Colors - exact from mockup
  static const Color primaryRed = Color(0xFFE8191F);
  static const Color primaryBlack = Color(0xFF0D0D0D);
  static const Color cardDark = Color(0xFF1A1A1A);
  static const Color cardBorder = Color(0xFF2E2E2E);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF888888);
  static const Color serviceWarning = Color(0xFFE8A019);
  static const Color statusGood = Color(0xFF2ECC71);
  static const Color ohlinsGold = Color(0xFFD4A017);
  static const Color tileBlue = Color(0xFF1A2744);
  static const Color tileGreen = Color(0xFF1A3A2A);
  static const Color tileGray = Color(0xFF1E2226);

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: primaryRed,
      scaffoldBackgroundColor: primaryBlack,
      colorScheme: const ColorScheme.dark(
        primary: primaryRed,
        surface: cardDark,
        onPrimary: textPrimary,
        onSurface: textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: textPrimary),
        titleTextStyle: GoogleFonts.poppins(
          color: textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 1,
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryRed,
          foregroundColor: textPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 15, letterSpacing: 0.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          elevation: 0,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF111111),
        selectedItemColor: primaryRed,
        unselectedItemColor: Color(0xFF555555),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
    );
  }
}