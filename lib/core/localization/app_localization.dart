// import 'dart:developer';

// class AppLocalizations {
//   // English and Hindi translations
//   static const Map<String, Map<String, String>> _localizedValues = {
//     'en': {
//       'welcome': 'Welcome',
//       'login': 'Login',
//       'logout': 'Logout',
//       'add_user': 'Add User',
//       'edit_user': 'Edit User',
//       'delete_user': 'Delete User',
//       'name': 'Name',
//       'job': 'Job',
//       'offline': 'You are offline',
//       'retry': 'Retry',
//     },
//     'hi': {
//       'welcome': 'स्वागत है',
//       'login': 'लॉगिन',
//       'logout': 'लॉगआउट',
//       'add_user': 'उपयोगकर्ता जोड़ें',
//       'edit_user': 'उपयोगकर्ता संपादित करें',
//       'delete_user': 'उपयोगकर्ता हटाएं',
//       'name': 'नाम',
//       'job': 'पद',
//       'offline': 'आप ऑफ़लाइन हैं',
//       'retry': 'पुनः प्रयास करें',
//     },
//   };

//    static String translate(String key, String locale) {
//     final value = _localizedValues[locale]?[key] ?? key;
//     log("AppLocalizations: translate('$key', '$locale') → '$value'");
//     return value;
//   }
// }


// import 'dart:developer';
// import 'package:flutter/material.dart';

// class AppLocalizations {
//   // Static map of translations
//   static const Map<String, Map<String, String>> _localizedValues = {
//     'en': {
//       'welcome': 'Welcome',
//       'login': 'Login',
//       'logout': 'Logout',
//       'add_user': 'Add User',
//       'edit_user': 'Edit User',
//       'delete_user': 'Delete User',
//       'name': 'Name',
//       'job': 'Job',
//       'offline': 'You are offline',
//       'retry': 'Retry',
//     },
//     'hi': {
//       'welcome': 'स्वागत है',
//       'login': 'लॉगिन',
//       'logout': 'लॉगआउट',
//       'add_user': 'उपयोगकर्ता जोड़ें',
//       'edit_user': 'उपयोगकर्ता संपादित करें',
//       'delete_user': 'उपयोगकर्ता हटाएं',
//       'name': 'नाम',
//       'job': 'पद',
//       'offline': 'आप ऑफ़लाइन हैं',
//       'retry': 'पुनः प्रयास करें',
//     },
//   };

//   // The active locale instance
//   final Locale locale;

//   AppLocalizations(this.locale);

//   // A helper method to easily access the AppLocalizations instance
//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
//   }

//   // A list of supported locales for the MaterialApp
//   static const Iterable<Locale> supportedLocales = [
//     Locale('en', ''), // English
//     Locale('hi', ''), // Hindi
//   ];

//   // The delegate is a factory for AppLocalizations objects.
//   // It is the key to Flutter's localization system.
//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       _AppLocalizationsDelegate();

//   // The getter to get a translated string
//   String translate(String key) {
//     final value = _localizedValues[locale.languageCode]?[key] ?? key;
//     log("AppLocalizations: translate('$key', '${locale.languageCode}') → '$value'");
//     return value;
//   }
// }

// // The custom delegate that tells Flutter how to load and handle our translations.
// class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();

//   // This method tells Flutter which locales are supported by our app.
//   @override
//   bool isSupported(Locale locale) {
//     return AppLocalizations.supportedLocales
//         .any((supportedLocale) => supportedLocale.languageCode == locale.languageCode);
//   }

//   // This method loads the translations for a given locale.
//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     return AppLocalizations(locale);
//   }

//   // This method controls whether the delegate should be reloaded.
//   // We've set it to 'false' because we don't need to reload our static data.
//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  // Static map of translations
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome',
      'login': 'Login',
      'logout': 'Logout',
      'add_user': 'Add User',
      'edit_user': 'Edit User',
      'delete_user': 'Delete User',
      'name': 'Name',
      'job': 'Job',
      'offline': 'You are offline',
      'retry': 'Retry',
    },
    'hi': {
      'welcome': 'स्वागत है',
      'login': 'लॉगिन',
      'logout': 'लॉगआउट',
      'add_user': 'उपयोगकर्ता जोड़ें',
      'edit_user': 'उपयोगकर्ता संपादित करें',
      'delete_user': 'उपयोगकर्ता हटाएं',
      'name': 'नाम',
      'job': 'पद',
      'offline': 'आप ऑफ़लाइन हैं',
      'retry': 'पुनः प्रयास करें',
    },
  };

  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const Iterable<Locale> supportedLocales = [
    Locale('en', ''),
    Locale('hi', ''),
  ];

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  String translate(String key) {
    final value = _localizedValues[locale.languageCode]?[key] ?? key;
    log("AppLocalizations: translate('$key', '${locale.languageCode}') → '$value'");
    return value;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales
        .any((supportedLocale) => supportedLocale.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}