import '../utils/sp_utils.dart';

class CommonSpUtil {
  static const String languageType = "languageType";

// 存语言配置
  static saveLanguageType(String languageType) {
    return SPUtils.setString(
        CommonSpUtil.languageType, languageType);
  }

  /// 获取语言配置 默认 中文
  static String getLanguageType()  {
     return  SPUtils.getString(CommonSpUtil.languageType);
  }
}
