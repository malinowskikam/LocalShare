import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StringsDelegate extends LocalizationsDelegate<Strings> {
  const StringsDelegate();

  static Map<String, Function> locales = {
    'en': () => StringsEn(),
    'pl': () => StringsPL()
  };

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) async =>
      locales[locale.languageCode]!.call();

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}

class FallbackMaterialDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      const DefaultMaterialLocalizations();

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}

class FallbackCupertinoDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) async =>
      const DefaultCupertinoLocalizations();

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}

abstract class Strings {
  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings)!;
  }

  String get appName;

  String get home;

  String get settings;
}

class StringsEn implements Strings {
  @override
  String get appName => 'LocalShare';

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';
}

class StringsPL implements Strings {
  @override
  String get appName => 'LocalShare';

  @override
  String get home => 'Start';

  @override
  String get settings => 'Ustawienia';
}
