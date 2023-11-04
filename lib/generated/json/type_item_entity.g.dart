import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/type_item_entity.dart';

TypeItemEntity $TypeItemEntityFromJson(Map<String, dynamic> json) {
  final TypeItemEntity typeItemEntity = TypeItemEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    typeItemEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    typeItemEntity.name = name;
  }
  final dynamic params = json['params'];
  if (params != null) {
    typeItemEntity.params = params;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    typeItemEntity.imageId = imageId;
  }
  final double? sort = jsonConvert.convert<double>(json['sort']);
  if (sort != null) {
    typeItemEntity.sort = sort;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    typeItemEntity.image = image;
  }
  return typeItemEntity;
}

Map<String, dynamic> $TypeItemEntityToJson(TypeItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['params'] = entity.params;
  data['image_id'] = entity.imageId;
  data['sort'] = entity.sort;
  data['image'] = entity.image;
  return data;
}

extension TypeItemEntityExtension on TypeItemEntity {
  TypeItemEntity copyWith({
    double? id,
    String? name,
    dynamic params,
    String? imageId,
    double? sort,
    String? image,
  }) {
    return TypeItemEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..params = params ?? this.params
      ..imageId = imageId ?? this.imageId
      ..sort = sort ?? this.sort
      ..image = image ?? this.image;
  }
}