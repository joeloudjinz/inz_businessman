import 'package:businessman/lang/localization.dart';
import 'package:flutter/material.dart';

/// Mixin to add localizer object into a class
///
/// help to reuse the same piece of code across view models, it has an
/// [InzLocalizations] object and a method holding [BuildContext]
/// object as a parameter ti fetch the localisation instance.
mixin LocalizationMixin {
  InzLocalizations l10n;

  prepareL10N(BuildContext context) {
    l10n = InzLocalizations.of(context);
  }
}
