import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

// We have to build this file before we uncomment the next import line,
import 'messages/messages_all.dart';

class InzLocalizations {
  /// Initialize localization systems and messages
  static Future<InzLocalizations> load(Locale locale) async {
    // If we're given "en_US", we'll use it as-is. If we're
    // given "en", we extract it and use it.
    final String localeName =
        locale.countryCode == null || locale.countryCode.isEmpty
            ? locale.languageCode
            : locale.toString();

    // final String localeName = 'ar_DZ';

    // We make sure the locale name is in the right format e.g.
    // converting "en-US" to "en_US".
    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    // Load localized messages for the current locale.
    await initializeMessages(canonicalLocaleName);
    // We'll uncomment the above line after we've built our messages file

    // Force the locale in Intl.
    Intl.defaultLocale = canonicalLocaleName;

    return InzLocalizations();
  }

  /// Retrieve localization resources for the widget tree
  /// corresponding to the given `context`
  static InzLocalizations of(BuildContext context) =>
      Localizations.of<InzLocalizations>(context, InzLocalizations);

  /* Error messages ______________________________________________________*/
  String get requiredError => Intl.message(
        'This field is required',
        name: 'requiredError',
      );

  String get invalidEmailError => Intl.message(
        'Email address is invalid',
        name: 'invalidEmailError',
      );

  String get passwordLengthError => Intl.message(
        'Password must contain more then 5 characters',
        name: 'passwordLengthError',
      );

  String get phoneZeroError => Intl.message(
        'Phone number is invalid, it must start with 0',
        name: 'phoneZeroError',
      );

  String get phoneLengthError => Intl.message(
        'Phone number is invalid, it must be 10 digits',
        name: 'phoneLengthError',
      );

  /// for phone verification
  String get codeLengthError => Intl.message(
        'Verification code is invalid, it must be 6 digits',
        name: 'codeLengthError',
      );

  /* splash screen ______________________________________________________*/
  String get splashScreenTitle => Intl.message(
        'Splash Screen',
        name: 'splashScreenTitle',
        desc: 'the title of splash screen',
      );

  /* login screen ______________________________________________________*/
  String get greetingCardBody => Intl.message(
        "Welcome back dear businessman, the market really needs your deals & services.",
        name: "greetingCardBody",
      );

  String get noAccountText => Intl.message(
        "You don't have an account? ",
        name: "noAccountText",
      );

  String get startBusinessText => Intl.message(
        "start your business from here",
        name: "startBusinessText",
      );

  String get passwordLabel => Intl.message(
        "Password",
        name: "passwordLabel",
      );

  String get emailLabel => Intl.message(
        "Email",
        name: "emailLabel",
      );

  String get loginButtonLabel => Intl.message(
        "Login",
        name: "loginButtonLabel",
      );

  /* phone registration screen ______________________________________________________*/
  String get phoneLabel => Intl.message(
        "Phone",
        name: "phoneLabel",
      );

  String get verifyPhoneButtonLabel => Intl.message(
        "Verify",
        name: "verifyPhoneButtonLabel",
      );

  String get agreementTextPart1 => Intl.message(
        "By clicking next, you agree to our ",
        name: "agreementTextPart1",
      );

  String get agreementTextPart2 => Intl.message(
        " and that you have read our ",
        name: "agreementTextPart2",
      );

  String get termsOfService => Intl.message(
        "Terms of service",
        name: "termsOfService",
      );

  String get privacyPolicy => Intl.message(
        "Privacy policy",
        name: "privacyPolicy",
      );

  String get phoneRegistrationCardTitle => Intl.message(
        "Phone Registration",
        name: "phoneRegistrationCardTitle",
      );

  String get phoneRegistrationCardBody => Intl.message(
        "we start with your phone number, it is crucial for running your business smoothly so make sure to provide a valid one.",
        name: "phoneRegistrationCardBody",
      );

  /* phone verification screen ______________________________________________________*/
  String get phoneVerificationCardTitle => Intl.message(
        "Phone Verification",
        name: "phoneVerificationCardTitle",
      );

  String get phoneVerificationCardBody => Intl.message(
        "Enter the 6 digits you received in the SMS. if you didn't receive the code click resend.",
        name: "phoneVerificationCardBody",
      );

  String get verificationCodeLabel => Intl.message(
        "Code",
        name: "verificationCodeLabel",
      );

  String get nextButtonLabel => Intl.message(
        "Verify",
        name: "nextButtonLabel",
      );

  String get resendButtonLabel => Intl.message(
        "Resend",
        name: "resendButtonLabel",
      );

/* second registration screen ______________________________________________________*/

  String get fullNameLabel => Intl.message(
        "Full Name",
        name: "fullNameLabel",
      );

  String get secondRegistrationCardTitle => Intl.message(
        "Final Registration",
        name: "secondRegistrationCardTitle",
      );

  String get secondRegistrationCardBody => Intl.message(
        "The final step at this journey, provide the necessary information about you and you are ready to grow your business.",
        name: "secondRegistrationCardBody",
      );

  String get submitButtonLabel => Intl.message(
        "Let's go",
        name: "submitButtonLabel",
      );
}
