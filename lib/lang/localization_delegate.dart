import 'dart:async';

import 'package:businessman/lang/localization.dart';
import 'package:flutter/material.dart';

import 'localization.dart';

class InzLocalizationsDelegate extends LocalizationsDelegate<InzLocalizations> {
  const InzLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ar', 'fr', 'en'].contains(locale.languageCode);

  @override
  Future<InzLocalizations> load(Locale locale) => InzLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<InzLocalizations> old) => true;
}
