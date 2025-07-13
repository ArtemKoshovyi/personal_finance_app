// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get pageTitle => 'Your Balance';

  @override
  String get dateColumn => 'Date';

  @override
  String get descriptionColumn => 'Description';

  @override
  String get amountColumn => 'Amount';

  @override
  String get addTransactionTitle => 'Add Transaction';

  @override
  String get titleInputField => 'Title';

  @override
  String get amountInputField => 'Amount';

  @override
  String get typeInputField => 'Type';

  @override
  String get dateInputField => 'Select Date';

  @override
  String get addButton => 'Submit';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get invalidMessage => 'Invalid input';
}
