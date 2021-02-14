import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration decorateFormTextField(IconData icon, String label) {
    return InputDecoration(
      fillColor: Colors.grey.shade200,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(
          width: 1.0,
        ),
      ),
      prefixIcon: Icon(icon),
      labelText: label,
    );
  }
}
