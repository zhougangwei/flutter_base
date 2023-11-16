import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/user_info_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
	late int id = 0;
	dynamic username;
	dynamic mobile;
	late int sex = 0;
	dynamic birthday;
	late String avatar = '';
	late String nickname = '';
	late String balance = '';
	late int point = 0;
	late int grade = 0;
	late int status = 0;
	late int pid = 0;
	late bool password = false;
	late int ctime = 0;
	late String remarks = '';
	late String email = '';
	@JSONField(name: "qr_code_id")
	dynamic qrCodeId;
	@JSONField(name: "grade_name")
	late String gradeName = '';
	@JSONField(name: "Wishlist")
	late int wishlist = 0;
	late int cart = 0;

	UserInfoEntity();

	factory UserInfoEntity.fromJson(Map<String, dynamic> json) => $UserInfoEntityFromJson(json);

	Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}