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
        fontSize: 20,
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
    )));

final darkTheme = ThemeData(
  extensions: const <ThemeExtension<dynamic>>[
    PollenMeterColors(
      lowRisk: Color(0xff6EC05A),
      moderateRisk: Color(0xffBBA42D),
      highRisk: Color(0xffB44C2B),
      veryHighRisk: Color(0xff9F2DBB),
    ),
  ],
  colorScheme: theme.colorScheme.copyWith(
    primary: const Color(0xff6750A4),
    secondary: const Color(0xffF3EDF7),
    surface: const Color(0xff49454F),
    onSurface: const Color(0xff1D1B20),
    secondaryContainer: const Color(0xffE8DEF8),
    outlineVariant: const Color(0xffE6E0E9),
    background: const Color(0xff000000),
  ),
  brightness: Brightness.light,
  shadowColor: Colors.grey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: GoogleFonts.montserrat().fontFamily,
  textTheme: theme.textTheme.copyWith(
    displayLarge: theme.textTheme.displayLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    displayMedium: theme.textTheme.displayMedium!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    displaySmall: theme.textTheme.displaySmall!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    headlineLarge: theme.textTheme.headlineLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    headlineMedium: theme.textTheme.headlineMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    headlineSmall: theme.textTheme.headlineSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    bodyLarge: theme.textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    bodyMedium: theme.textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    bodySmall: theme.textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    titleLarge: theme.textTheme.titleLarge!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    titleMedium: theme.textTheme.titleMedium!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    titleSmall: theme.textTheme.titleSmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    labelLarge: theme.textTheme.labelLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    labelMedium: theme.textTheme.labelLarge!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
    labelSmall: theme.textTheme.labelSmall!.copyWith(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: Colors.black,
      fontFamily: GoogleFonts.montserrat().fontFamily,
    ),
  ),
);
