import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pollen_meter/pollen_meter_colors.dart';

final ThemeData theme = ThemeData();
final brightColorScheme = theme.colorScheme.copyWith(
  primary: const Color(0xff60d394),
  secondary: const Color(0xffF8F8F8),
  background: const Color(0xffffffff),
  outline: const Color(0xff000000),
);
final darkColorScheme = theme.colorScheme.copyWith(
  primary: const Color(0xff60d394),
  secondary: const Color(0xff323633),
  background: const Color(0xff111412),
  outline: const Color(0xfff8f8f8),
);
final brightTheme = ThemeData(
  extensions: const <ThemeExtension<dynamic>>[
    PollenMeterColors(
      lowRisk: Color(0xffaaf683),
      moderateRisk: Color(0xffffd97d),
      highRisk: Color(0xffFF9B85),
      veryHighRisk: Color(0xffEE6055),
    ),
  ],
  colorScheme: brightColorScheme,
  shadowColor: const Color(0xff000000).withOpacity(0.25),
  brightness: Brightness.light,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: theme.textTheme.copyWith(
    //The names are completely arbitrary. Just make sure you use the same names.
    displayLarge: theme.textTheme.displayLarge!.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    displayMedium: theme.textTheme.displayMedium!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    displaySmall: theme.textTheme.displaySmall!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    headlineLarge: theme.textTheme.headlineLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    headlineMedium: theme.textTheme.headlineMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    headlineSmall: theme.textTheme.headlineSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    bodyLarge: theme.textTheme.bodyLarge!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    bodyMedium: theme.textTheme.bodyMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: const Color(0xff7e7e7e),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    bodySmall: theme.textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    titleLarge: theme.textTheme.titleLarge!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    titleMedium: theme.textTheme.titleMedium!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    titleSmall: theme.textTheme.titleSmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    labelLarge: theme.textTheme.labelLarge!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: brightColorScheme.primary,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    labelMedium: theme.textTheme.labelMedium!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    labelSmall: theme.textTheme.labelSmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
  ),
  primaryTextTheme: theme.primaryTextTheme.copyWith(
    displayLarge: theme.primaryTextTheme.displayLarge!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    displayMedium: theme.primaryTextTheme.displayMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        letterSpacing: 0),
  ),
);

final darkTheme = ThemeData(
  extensions: const <ThemeExtension<dynamic>>[
    PollenMeterColors(
      lowRisk: Color(0xffaaf683),
      moderateRisk: Color(0xffffd97d),
      highRisk: Color(0xffFF9B85),
      veryHighRisk: Color(0xffEE6055),
    ),
  ],
  colorScheme: darkColorScheme,
  shadowColor: const Color(0xffffffff).withOpacity(0.05),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: theme.textTheme.copyWith(
    //The names are completely arbitrary. Just make sure you use the same names.
    displayLarge: theme.textTheme.displayLarge!.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    displayMedium: theme.textTheme.displayMedium!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    displaySmall: theme.textTheme.displaySmall!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    headlineLarge: theme.textTheme.headlineLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    headlineMedium: theme.textTheme.headlineMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    headlineSmall: theme.textTheme.headlineSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    bodyLarge: theme.textTheme.bodyLarge!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    bodyMedium: theme.textTheme.bodyMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: const Color(0xff7e7e7e),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    bodySmall: theme.textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    titleLarge: theme.textTheme.titleLarge!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    titleMedium: theme.textTheme.titleMedium!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    titleSmall: theme.textTheme.titleSmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    labelLarge: theme.textTheme.labelLarge!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: brightColorScheme.primary,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    labelMedium: theme.textTheme.labelMedium!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    labelSmall: theme.textTheme.labelSmall!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
  ),
  primaryTextTheme: theme.primaryTextTheme.copyWith(
    displayLarge: theme.primaryTextTheme.displayLarge!.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      letterSpacing: 0,
    ),
    displayMedium: theme.primaryTextTheme.displayMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        letterSpacing: 0),
  ),
);
