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
      primaryColor: CustomColors.dark,
      accentColor: CustomColors.strongOrange,
      scaffoldBackgroundColor: CustomColors.light,
      textTheme: const TextTheme(
        headline4: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black54),
        caption: TextStyle(color: Colors.black45),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.0),
        ),
        color: CustomColors.lightOrange,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: CustomColors.lightOrange,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22.0),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColors.dark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
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
