import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/mixins/localization_mixin.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneRegistrationViewModel with LocalizationMixin {
  final phoneRegistrationFormKey = GlobalKey<FormState>();
  final navigator = locator<NavigationService>();
  String phone;

  submit() {
    if (!phoneRegistrationFormKey.currentState.validate()) {
      return;
    }
    print(phone);
  }

  String processValue(String value) {
    final String trimmed = value.trim();
    if (trimmed.isEmpty) {
      return l10n.requiredError;
    }
    if (trimmed[0] != '0') {
      return l10n.phoneZeroError;
    }
    if (trimmed.length != 10) {
      return l10n.phoneLengthError;
    }

    phone = "+213${trimmed.substring(1, trimmed.length)}";

    return null;
  }
}
