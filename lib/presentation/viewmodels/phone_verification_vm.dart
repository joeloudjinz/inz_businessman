import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/presentation/mixins/localization_mixin.dart';
import 'package:businessman/presentation/states/phone_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneVerificationViewModel with LocalizationMixin {
  final phoneVerificationFormKey = GlobalKey<FormState>();
  final navigator = locator<NavigationService>();
  String code;

  submit() {
    if (!phoneVerificationFormKey.currentState.validate()) {
      return;
    }
    print(code);
  }

  resendPressed(PhoneVerificationState notifier) {
    notifier.reStartTimer();
    notifier.disableResendBtn();
  }

  onTimerEndEvent(PhoneVerificationState notifier) {
    notifier.enableResendBtn();
    notifier.resetTimer();
  }

  String validateCode(String value) {
    if (value.length != 6) {
      return l10n.codeLengthError;
    }

    code = value;
    return null;
  }
}
