class AppLocalizations {
  // English and Hindi translations
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

  static String translate(String key, String locale) {
    return _localizedValues[locale]?[key] ?? key;
  }
}
