import 'package:businessman/core/generated/locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneRegistrationViewModel {
  final phoneRegistrationFormKey = GlobalKey<FormState>();
  final navigator = locator<NavigationService>();
  String phone;

  submit() {
    if (!phoneRegistrationFormKey.currentState.validate()) {
      return;
    }
    print(phone);
  }

  processValue(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      return 'should not be empty';
    }
    if (trimmed[0] != '0') {
      return 'phone number is invalid, it should start with 0';
    }
    if (trimmed.length != 10) {
      return 'phone number is invalid, it should be 10 digits';
    }

    phone = "+213${trimmed.substring(1, trimmed.length)}";

    return null;
  }
}
