import 'package:flutter/material.dart';

import 'colors.dart';

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: CustomColors.light,
      textTheme: Typography.blackRedmond,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        color: Colors.blueGrey.shade100,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white60,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: CustomColors.dark,
      scaffoldBackgroundColor: CustomColors.dark,
      textTheme: ThemeData.dark().textTheme,
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: CustomColors.light,
      ),
    );
  }
}
