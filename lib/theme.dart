import 'package:flutter/material.dart';

final ThemeData theme = ThemeData();
final brightTheme = ThemeData(
  colorScheme: theme.colorScheme.copyWith(
      primary: const Color(0xff6750A4), secondary: const Color(0xffe6e0e9)),
  shadowColor: Colors.grey,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Montserrat',
  textTheme: theme.textTheme.copyWith(
    displayLarge: theme.textTheme.displayLarge!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displayMedium: theme.textTheme.displayMedium!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    displaySmall: theme.textTheme.displaySmall!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: theme.textTheme.headlineLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineMedium: theme.textTheme.headlineMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineSmall: theme.textTheme.headlineSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyLarge: theme.textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyMedium: theme.textTheme.bodyMedium!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodySmall: theme.textTheme.bodySmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleLarge: theme.textTheme.titleLarge!.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    titleMedium: theme.textTheme.titleMedium!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    titleSmall: theme.textTheme.titleSmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    labelLarge: theme.textTheme.labelLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelMedium: theme.textTheme.labelLarge!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    labelSmall: theme.textTheme.labelSmall!.copyWith(
      fontSize: 8,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  ),
);
