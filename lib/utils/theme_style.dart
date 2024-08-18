import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyles {
  static ThemeData themeData(bool lightTheme, BuildContext buildContext) {
    bool isWeb = kIsWeb; // Check if the platform is Web

    return lightTheme
        ? ThemeData(
            brightness: Brightness.light,
            highlightColor: Colors.black,
            canvasColor: Colors.white,
            colorScheme:
                ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
              secondary: Colors.black,
              brightness: Brightness.light,
            ),
            textTheme: TextTheme(
              displayLarge: GoogleFonts.openSans(
                  fontSize: isWeb ? 60 : 57, // Adjust font size for Web
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
              displayMedium: GoogleFonts.openSans(
                  fontSize: isWeb ? 48 : 45, // Adjust font size for Web
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
              displaySmall: GoogleFonts.openSans(
                  fontSize: isWeb ? 38 : 36, // Adjust font size for Web
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              headlineLarge: GoogleFonts.openSans(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              headlineMedium: GoogleFonts.openSans(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              headlineSmall: GoogleFonts.openSans(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              titleLarge: GoogleFonts.openSans(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              titleMedium: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              titleSmall: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              bodyLarge: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              bodyMedium: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              bodySmall: GoogleFonts.openSans(
                  fontSize: 12,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.normal),
              labelLarge: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
              labelMedium: GoogleFonts.openSans(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              labelSmall: GoogleFonts.openSans(
                  fontSize: 11,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500),
            ),
          )
        : ThemeData(
            brightness: Brightness.dark,
            canvasColor: Colors.white,
            colorScheme:
                ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(
              brightness: Brightness.dark,
            ),
            textTheme: TextTheme(
              displayLarge: GoogleFonts.openSans(
                  fontSize: isWeb ? 60 : 57, // Adjust font size for Web
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
              displayMedium: GoogleFonts.openSans(
                  fontSize: isWeb ? 48 : 45, // Adjust font size for Web
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              displaySmall: GoogleFonts.openSans(
                  fontSize: isWeb ? 38 : 36, // Adjust font size for Web
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              headlineLarge: GoogleFonts.openSans(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              headlineMedium: GoogleFonts.openSans(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              headlineSmall: GoogleFonts.openSans(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              titleLarge: GoogleFonts.openSans(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              titleMedium: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              titleSmall: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              bodyLarge: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
              bodyMedium: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
              bodySmall: GoogleFonts.openSans(
                  fontSize: 12,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.normal),
              labelLarge: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              labelMedium: GoogleFonts.openSans(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
              labelSmall: GoogleFonts.openSans(
                  fontSize: 11,
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w500),
            ),
          );
  }
}
