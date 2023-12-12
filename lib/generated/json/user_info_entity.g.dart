import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/shop/bean/user_info_entity.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoEntity.id = id;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoEntity.username = username;
  }
  final dynamic mobile = json['mobile'];
  if (mobile != null) {
    userInfoEntity.mobile = mobile;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    userInfoEntity.sex = sex;
  }
  final dynamic birthday = json['birthday'];
  if (birthday != null) {
    userInfoEntity.birthday = birthday;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    userInfoEntity.avatar = avatar;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    userInfoEntity.nickname = nickname;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    userInfoEntity.balance = balance;
  }
  final int? point = jsonConvert.convert<int>(json['point']);
  if (point != null) {
    userInfoEntity.point = point;
  }
  final int? grade = jsonConvert.convert<int>(json['grade']);
  if (grade != null) {
    userInfoEntity.grade = grade;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    userInfoEntity.status = status;
  }
  final int? pid = jsonConvert.convert<int>(json['pid']);
  if (pid != null) {
    userInfoEntity.pid = pid;
  }
  final bool? password = jsonConvert.convert<bool>(json['password']);
  if (password != null) {
    userInfoEntity.password = password;
  }
  final int? ctime = jsonConvert.convert<int>(json['ctime']);
  if (ctime != null) {
    userInfoEntity.ctime = ctime;
  }
  final String? remarks = jsonConvert.convert<String>(json['remarks']);
  if (remarks != null) {
    userInfoEntity.remarks = remarks;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userInfoEntity.email = email;
  }
  final dynamic qrCodeId = json['qr_code_id'];
  if (qrCodeId != null) {
    userInfoEntity.qrCodeId = qrCodeId;
  }
  final String? gradeName = jsonConvert.convert<String>(json['grade_name']);
  if (gradeName != null) {
    userInfoEntity.gradeName = gradeName;
  }
  final int? wishlist = jsonConvert.convert<int>(json['Wishlist']);
  if (wishlist != null) {
    userInfoEntity.wishlist = wishlist;
  }
  final int? cart = jsonConvert.convert<int>(json['cart']);
  if (cart != null) {
    userInfoEntity.cart = cart;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['mobile'] = entity.mobile;
  data['sex'] = entity.sex;
  data['birthday'] = entity.birthday;
  data['avatar'] = entity.avatar;
  data['nickname'] = entity.nickname;
  data['balance'] = entity.balance;
  data['point'] = entity.point;
  data['grade'] = entity.grade;
  data['status'] = entity.status;
  data['pid'] = entity.pid;
  data['password'] = entity.password;
  data['ctime'] = entity.ctime;
  data['remarks'] = entity.remarks;
  data['email'] = entity.email;
  data['qr_code_id'] = entity.qrCodeId;
  data['grade_name'] = entity.gradeName;
  data['Wishlist'] = entity.wishlist;
  data['cart'] = entity.cart;
  return data;
}

extension UserInfoEntityExtension on UserInfoEntity {
  UserInfoEntity copyWith({
    int? id,
    String? username,
    dynamic mobile,
    int? sex,
    dynamic birthday,
    String? avatar,
    String? nickname,
    String? balance,
    int? point,
    int? grade,
    int? status,
    int? pid,
    bool? password,
    int? ctime,
    String? remarks,
    String? email,
    dynamic qrCodeId,
    String? gradeName,
    int? wishlist,
    int? cart,
  }) {
    return UserInfoEntity()
      ..id = id ?? this.id
      ..username = username ?? this.username
      ..mobile = mobile ?? this.mobile
      ..sex = sex ?? this.sex
      ..birthday = birthday ?? this.birthday
      ..avatar = avatar ?? this.avatar
      ..nickname = nickname ?? this.nickname
      ..balance = balance ?? this.balance
      ..point = point ?? this.point
      ..grade = grade ?? this.grade
      ..status = status ?? this.status
      ..pid = pid ?? this.pid
      ..password = password ?? this.password
      ..ctime = ctime ?? this.ctime
      ..remarks = remarks ?? this.remarks
      ..email = email ?? this.email
      ..qrCodeId = qrCodeId ?? this.qrCodeId
      ..gradeName = gradeName ?? this.gradeName
      ..wishlist = wishlist ?? this.wishlist
      ..cart = cart ?? this.cart;
  }
}