import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/type_item_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/type_item_entity.g.dart';

@JsonSerializable()
class TypeItemEntity {
	late double id;
	late String name = '';
	dynamic params;
	@JSONField(name: "image_id")
	late String imageId = '';
	late double sort;
	late String image = '';

	TypeItemEntity();

	factory TypeItemEntity.fromJson(Map<String, dynamic> json) => $TypeItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $TypeItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}