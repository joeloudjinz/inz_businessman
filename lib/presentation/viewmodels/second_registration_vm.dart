import 'package:businessman/core/generated/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondRegistrationViewModel {
  final secondRegistrationFormKey = GlobalKey<FormState>();
  final navigator = locator<NavigationService>();

  String password, email, fullName;

  submit() {
    if (!secondRegistrationFormKey.currentState.validate()) {
      return;
    }
    debugPrint(fullName);
    debugPrint(email);
    debugPrint(password);
  }

  String validateFullName(String value) {
    if (value.isEmpty) {
      return 'should not be empty';
    }
    fullName = value;
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'this field should not be empty';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'email address is invalid';
    }
    email = value;
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'should not be empty';
    }
    if (value.length <= 5) {
      return 'password must contain more then 5';
    }
    password = value;
    return null;
  }
}
