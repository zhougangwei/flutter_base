import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/balance_bean_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/balance_bean_entity.g.dart';

@JsonSerializable()
class BalanceBeanEntity {
	late int id;
	@JSONField(name: "user_id")
	late int userId;
	late String type = '';
	late String money = '';
	late String balance = '';
	@JSONField(name: "source_id")
	late String sourceId = '';
	late String memo = '';
	late String ctime = '';
	@JSONField(name: "order_id")
	late String orderId = '';

	BalanceBeanEntity();

	factory BalanceBeanEntity.fromJson(Map<String, dynamic> json) => $BalanceBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $BalanceBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}