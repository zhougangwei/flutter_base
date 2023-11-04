import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/banner_bean_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class BannerBeanEntity {
	late double id;
	@JSONField(name: "position_id")
	late double positionId;
	late String code = '';
	late String name = '';
	late String img = '';
	late double type;
	late String val = '';
	late double sort;

	BannerBeanEntity();

	factory BannerBeanEntity.fromJson(Map<String, dynamic> json) => $BannerBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $BannerBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}