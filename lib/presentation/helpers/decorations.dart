import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration forIconTextField(IconData icon, String label) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      labelText: label,
    );
  }

  static InputDecoration forTextField(String label) {
    return InputDecoration(
      labelText: label,
    );
  }
}
