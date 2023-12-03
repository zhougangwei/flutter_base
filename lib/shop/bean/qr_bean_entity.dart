import 'package:abce/generated/json/base/json_field.dart';
import 'package:abce/generated/json/qr_bean_entity.g.dart';
import 'dart:convert';
export 'package:abce/generated/json/qr_bean_entity.g.dart';

@JsonSerializable()
class QrBeanEntity {
	@JSONField(name: "qr_code_id")
	late String qrCodeId = '';
	@JSONField(name: "qr_codes")
	late String qrCodes = '';
	@JSONField(name: "qr_code")
	late String qrCode = '';

	QrBeanEntity();

	factory QrBeanEntity.fromJson(Map<String, dynamic> json) => $QrBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $QrBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}