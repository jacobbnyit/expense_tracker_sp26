
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 55, 158, 150),);
var kDarkColorScheme = ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Color.fromARGB(255, 18, 27, 32),);

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.normal,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 14,
          ),
        ),
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
    ),
    );
}