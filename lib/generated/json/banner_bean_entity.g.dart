import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/shop/bean/banner_bean_entity.dart';

BannerBeanEntity $BannerBeanEntityFromJson(Map<String, dynamic> json) {
  final BannerBeanEntity bannerBeanEntity = BannerBeanEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bannerBeanEntity.id = id;
  }
  final double? positionId = jsonConvert.convert<double>(json['position_id']);
  if (positionId != null) {
    bannerBeanEntity.positionId = positionId;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    bannerBeanEntity.code = code;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    bannerBeanEntity.name = name;
  }
  final String? img = jsonConvert.convert<String>(json['img']);
  if (img != null) {
    bannerBeanEntity.img = img;
  }
  final double? type = jsonConvert.convert<double>(json['type']);
  if (type != null) {
    bannerBeanEntity.type = type;
  }
  final String? val = jsonConvert.convert<String>(json['val']);
  if (val != null) {
    bannerBeanEntity.val = val;
  }
  final double? sort = jsonConvert.convert<double>(json['sort']);
  if (sort != null) {
    bannerBeanEntity.sort = sort;
  }
  return bannerBeanEntity;
}

Map<String, dynamic> $BannerBeanEntityToJson(BannerBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['position_id'] = entity.positionId;
  data['code'] = entity.code;
  data['name'] = entity.name;
  data['img'] = entity.img;
  data['type'] = entity.type;
  data['val'] = entity.val;
  data['sort'] = entity.sort;
  return data;
}

extension BannerBeanEntityExtension on BannerBeanEntity {
  BannerBeanEntity copyWith({
    int? id,
    double? positionId,
    String? code,
    String? name,
    String? img,
    double? type,
    String? val,
    double? sort,
  }) {
    return BannerBeanEntity()
      ..id = id ?? this.id
      ..positionId = positionId ?? this.positionId
      ..code = code ?? this.code
      ..name = name ?? this.name
      ..img = img ?? this.img
      ..type = type ?? this.type
      ..val = val ?? this.val
      ..sort = sort ?? this.sort;
  }
}