import 'package:abce/language/language_sp_utils.dart';
import 'package:flutter/material.dart';

class CurrentLocale with ChangeNotifier {
  Locale get value => Locale.fromSubtags(languageCode: getLanaugaeCode());

  void setLanaugaeCode(languageCode) {
    LanuageSpUtil.saveLanguageType(languageCode);
    notifyListeners();
  }

  String getLanaugaeCode() {
    var languageType = LanuageSpUtil.getLanguageType();
    if (languageType .isNotEmpty) {
      return languageType;
    }
    return "en";
  }

  getCurrentCountryCodeImgCode() {
    String imgCode = '2';
    var e = getLanaugaeCode();
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
    } else if (e == 'zh'){
      imgCode = '6';}
    else {
      imgCode = '2';
    }
    return imgCode;
  }
}
