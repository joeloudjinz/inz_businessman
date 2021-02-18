import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/mixins/localization_mixin.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondRegistrationViewModel with LocalizationMixin {
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
      return l10n.requiredError;
    }
    fullName = value;
    return null;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return l10n.requiredError;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return l10n.invalidEmailError;
    }
    email = value;
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return l10n.requiredError;
    }
    if (value.length <= 5) {
      return l10n.passwordLengthError;
    }
    password = value;
    return null;
  }
}
