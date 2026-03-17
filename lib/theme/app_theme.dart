import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Colors ──────────────────────────────────────────────────────────
  static const Color primaryColor = Color(0xFF7B2FF7);
  static const Color primaryLight = Color(0xFF9D5CFF);
  static const Color primaryDark = Color(0xFF5A1DB8);
  static const Color backgroundColor = Color(0xFF1E1E2C);
  static const Color surfaceDark = Color(0xFF16161F);
  static const Color cardColor = Color(0xFF2A2A3D);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB0B0C3);
  static const Color textMuted = Color(0xFF6C6C80);
  static const Color starColor = Color(0xFFFFB800);
  static const Color greenAccent = Color(0xFF21D07A);
  static const Color heartColor = Color(0xFFFF4D6D);

  // ── Gradients ──────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF9D5CFF), Color(0xFF7B2FF7), Color(0xFF5A1DB8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient headerGradient = LinearGradient(
    colors: [Color(0xFF9D5CFF), Color(0xFF7B2FF7)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // ── Theme ──────────────────────────────────────────────────────────
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryLight,
        surface: cardColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: textPrimary),
        iconTheme: const IconThemeData(color: textPrimary),
      ),
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold, color: textPrimary),
        headlineMedium: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary),
        headlineSmall: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: textPrimary),
        titleLarge: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600, color: textPrimary),
        titleMedium: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w500, color: textPrimary),
        bodyLarge: GoogleFonts.poppins(fontSize: 13, color: textSecondary, height: 1.6),
        bodyMedium: GoogleFonts.poppins(fontSize: 11, color: textSecondary),
        bodySmall: GoogleFonts.poppins(fontSize: 10, color: textMuted),
      ),
    );
  }
}
