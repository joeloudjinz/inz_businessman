import 'package:businessman/core/generated/locator.dart';
import 'package:businessman/main.dart';
import 'package:businessman/presentation/states/phone_verification_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';

class PhoneVerificationViewModel {
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
      return "The code must be 6 characters.";
    }

    code = value;
    return null;
  }
}
