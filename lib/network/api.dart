import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/sp_utils.dart';
import '../utils/common_utils.dart';
import 'config.dart';
final String url = config.apiUrl.url;
final String loginUrl = config.apiUrl.loginUrl;
final String nginxFdfsUrl = config.apiUrl.nginxFdfsUrl;

Future<Map<String, dynamic>> ax({
  String url = '',
  String method = 'GET',
  Map<String, String> headers = const {},
  Map<String, dynamic> data = const {},
  bool auth = true,
  bool showToast = true,
}) async {

  final token =   SPUtils.getString("token");

  if (auth && token == null) {
    errorToShow('Please log in first');
    return {};
  }

  if (auth && token != null) {
    data['token'] = token;
  }
  print("http： 请求了接口"+jsonEncode(data)+ "\n\n  token是"+token);

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(data),
  );

  final responseData = jsonDecode(response.body);

  if (responseData['data'] == 14007) {
     SPUtils.setString('token', '');
    errorToShow('Please log in first');
  }

  if (responseData['status'] != true) {
    if (showToast) {
      final title = responseData['msg'] ?? '操作失败，请稍后再试~';
      final duration = title.toString().length > 11 ? 3000 : 1500;

    }
    return responseData;
  }

  return responseData;
}

Future<Map<String, dynamic>> get({
  required String url,
  Map<String, dynamic>? params,
  bool auth = true,
  bool showToast = true,
}) {
  return ax(
    url: url,
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
    data: params ?? {},
    auth: auth,
    showToast: showToast,
  );
}

Future<Map<String, dynamic>> post({
  required String url,
  Map<String, dynamic>? params,
  bool auth = true,
  bool showToast = true,
}) {
  return ax(
    url: url,
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    data: params ?? {},
    auth: auth,
    showToast: showToast,
  );
}

Future<Map<String, dynamic>> del({
  required String url,
  Map<String, dynamic>? params,
  bool auth = true,
  bool showToast = true,
}) {
  return ax(
    url: url,
    method: 'DELETE',
    headers: {
      'Content-Type': 'application/json',
    },
    data: params ?? {},
    auth: auth,
    showToast: showToast,
  );
}

Future<Map<String, dynamic>> put({
  required String url,
  Map<String, dynamic>? params,
  bool auth = true,
  bool showToast = true,
}) {
  return ax(
    url: url,
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json',
    },
    data: params ?? {},
    auth: auth,
    showToast: showToast,
  );
}

Future<Map<String, dynamic>> patch({
  required String url,
  Map<String, dynamic>? params,
  bool auth = true,
  bool showToast = true,
}) {
  return ax(
    url: url,
    method: 'PATCH',
    headers: {
      'Content-Type': 'application/json',
    },
    data: params ?? {},
    auth: auth,
    showToast: showToast,
  );
}

Future<Map<String, dynamic>> op({
  required String url,
  Map<String, dynamic>? params,
  bool auth = true,
}) {
  return ax(
    url: url,
    method: 'OPTIONS',
    headers: {
      'Content-Type': 'application/json',
    },
    data: params ?? {},
    auth: auth,
  );
}

Future<Map<String, dynamic>> upload({
  required String url,
  required String params,
  bool auth = true,
  Map<String, String> formData = const {},
}) async {
  final response = await http.MultipartFile.fromPath('file', params);

  final request = http.MultipartRequest('POST', Uri.parse(url));
  request.headers.addAll({
    'Content-Type': 'multipart/form-data',
  });
  request.fields.addAll(formData);
  request.files.add(response);

  final streamedResponse = await request.send();
  final responseData = await streamedResponse.stream.bytesToString();

  return jsonDecode(responseData);
}


