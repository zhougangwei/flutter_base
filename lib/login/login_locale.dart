import 'package:flutter/material.dart';

class CurrentLocale with ChangeNotifier {
  Locale _locale = Locale.fromSubtags(languageCode: 'en');

  Locale get value => _locale;

  void setLocale(locale) {
    _locale = locale;
    notifyListeners();
  }

  getCurrentCountryCodeImgCode() {
    String imgCode = '2';
    var e = _locale.languageCode;
    if (e == 'es') {
      imgCode = '1';
    } else if (e == 'de') {
      imgCode = '0';
    } else if (e == 'fr') {
      imgCode = '3';
    } else if (e == 'ja') {
      imgCode = '4';
    } else if (e == 'it') {
      imgCode = '5';
    } else {
      imgCode = '2';
    }
    return imgCode;
  }
}
