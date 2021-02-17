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

  String get splashScreenTitle => Intl.message(
        'Splash Screen',
        name: 'splashScreenTitle',
        desc: 'the title of splash screen',
      );
}
