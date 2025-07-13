import 'package:flutter/material.dart';
import 'package:personal_finance_app/l10n/gen_l10n/app_localizations.dart';

export 'package:personal_finance_app/l10n/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
