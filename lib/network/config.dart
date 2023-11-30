import 'dart:collection';

class SystemInfo {
  final double statusBarHeight;
  final double windowWidth;
  final double windowHeight;

  SystemInfo({
    required this.statusBarHeight,
    required this.windowWidth,
    required this.windowHeight,
  });

  factory SystemInfo.fromJson(Map<String, dynamic> json) {
    return SystemInfo(
      statusBarHeight: 1,
      windowWidth: 1,
      windowHeight: 1,
    );
  }
}

class ApiUrl {
  final String url;
  final String avatarUrl;
  final String loginUrl;
  final String nginxFdfsUrl;

  ApiUrl({
    required this.url,
    required this.avatarUrl,
    required this.loginUrl,
    required this.nginxFdfsUrl,
  });
}

class Config {
  final ApiUrl apiUrl;
  final String navigationBarTextStyle;
  final String navigationBarBackgroundColor;
  final SystemInfo systemInfo;

  Config({
    required this.apiUrl,
    required this.navigationBarTextStyle,
    required this.navigationBarBackgroundColor,
    required this.systemInfo,
  });

  factory Config.fromEnvironment(String environment) {
    final systemInfo = SystemInfo.fromJson(HashMap());

    final dev = ApiUrl(
      url: 'http://45.77.80.191/api.html',
      avatarUrl: '',
      loginUrl: '',
      nginxFdfsUrl: '',
    );

    final production = ApiUrl(
      url: 'https://abcadm.cc/api.html',
      avatarUrl: '',
      loginUrl: '',
      nginxFdfsUrl: '',
    );

    ApiUrl apiUrl = dev;
    if (environment == 'production') {
      apiUrl = production;
    }

    return Config(
      apiUrl: apiUrl,
      navigationBarTextStyle: 'white',
      navigationBarBackgroundColor: '#072D8C',
      systemInfo: systemInfo,
    );
  }
}

final config = Config.fromEnvironment('production');