import 'dart:ui';

import 'language_sp_utils.dart';

class LocaleTool {
  // 获取本地存储的配置语言
  static List<String> languageConfig() {
    List<String> list = ["zh", 'CN'];
    String language = CommonSpUtil.getLanguageType();
    if (language.isNotEmpty) {
      List<String> languageList = language.split('_');
      if (languageList.length >= 2) {
        list = languageList;
      }
    }
    return list;
  }

  /// 切换语言
  changeLanguage({required languageStr}) async {
    List list = languageStr.split('_');
    String languageCode = 'zh';
    String countryCode = "CN";
    if (list.length == 2) {
      languageCode = list[0];
      countryCode = list[1];
    }
    var locale = Locale(languageCode, countryCode);

    /// 更新语言

    /// 存储本地语言配置
    await CommonSpUtil.saveLanguageType(languageStr);
  }

  /// 配置语言 根据需求 进行处理
  String configlanguage(String string) {
    String languagestr = "zh_CN";
    switch (string) {
      case "简体中文":
        languagestr = "zh_CN";
        break;
      case "English":
        languagestr = "en_US";
        break;
      default:
    }
    return languagestr;
  }
}
