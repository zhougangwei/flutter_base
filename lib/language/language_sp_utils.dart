import '../sp/sp_utils.dart';

class CommonSpUtil {
  static const String languageType = "languageType";

// 存语言配置
  static saveLanguageType(String languageType) {
    return SharedPreferencesUtils.setString(
        CommonSpUtil.languageType, languageType);
  }

  /// 获取语言配置 默认 中文
  static String getLanguageType()  {
     return  SharedPreferencesUtils.getString(CommonSpUtil.languageType);
  }
}
