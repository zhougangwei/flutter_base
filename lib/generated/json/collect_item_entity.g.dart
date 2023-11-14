import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/collect_item_entity.dart';

CollectItemEntity $CollectItemEntityFromJson(Map<String, dynamic> json) {
  final CollectItemEntity collectItemEntity = CollectItemEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    collectItemEntity.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    collectItemEntity.goodsId = goodsId;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    collectItemEntity.userId = userId;
  }
  final String? goodsName = jsonConvert.convert<String>(json['goods_name']);
  if (goodsName != null) {
    collectItemEntity.goodsName = goodsName;
  }
  final int? ctime = jsonConvert.convert<int>(json['ctime']);
  if (ctime != null) {
    collectItemEntity.ctime = ctime;
  }
  final CollectItemGoods? goods = jsonConvert.convert<CollectItemGoods>(
      json['goods']);
  if (goods != null) {
    collectItemEntity.goods = goods;
  }
  final int? scoreSum = jsonConvert.convert<int>(json['score_sum']);
  if (scoreSum != null) {
    collectItemEntity.scoreSum = scoreSum;
  }
  return collectItemEntity;
}

Map<String, dynamic> $CollectItemEntityToJson(CollectItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['user_id'] = entity.userId;
  data['goods_name'] = entity.goodsName;
  data['ctime'] = entity.ctime;
  data['goods'] = entity.goods.toJson();
  data['score_sum'] = entity.scoreSum;
  return data;
}

extension CollectItemEntityExtension on CollectItemEntity {
  CollectItemEntity copyWith({
    int? id,
    int? goodsId,
    int? userId,
    String? goodsName,
    int? ctime,
    CollectItemGoods? goods,
    int? scoreSum,
  }) {
    return CollectItemEntity()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..userId = userId ?? this.userId
      ..goodsName = goodsName ?? this.goodsName
      ..ctime = ctime ?? this.ctime
      ..goods = goods ?? this.goods
      ..scoreSum = scoreSum ?? this.scoreSum;
  }
}

CollectItemGoods $CollectItemGoodsFromJson(Map<String, dynamic> json) {
  final CollectItemGoods collectItemGoods = CollectItemGoods();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    collectItemGoods.id = id;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    collectItemGoods.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    collectItemGoods.name = name;
  }
  final String? brief = jsonConvert.convert<String>(json['brief']);
  if (brief != null) {
    collectItemGoods.brief = brief;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    collectItemGoods.price = price;
  }
  final String? costprice = jsonConvert.convert<String>(json['costprice']);
  if (costprice != null) {
    collectItemGoods.costprice = costprice;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    collectItemGoods.mktprice = mktprice;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    collectItemGoods.imageId = imageId;
  }
  final int? goodsCatId = jsonConvert.convert<int>(json['goods_cat_id']);
  if (goodsCatId != null) {
    collectItemGoods.goodsCatId = goodsCatId;
  }
  final int? goodsTypeId = jsonConvert.convert<int>(json['goods_type_id']);
  if (goodsTypeId != null) {
    collectItemGoods.goodsTypeId = goodsTypeId;
  }
  final int? brandId = jsonConvert.convert<int>(json['brand_id']);
  if (brandId != null) {
    collectItemGoods.brandId = brandId;
  }
  final int? isNomalVirtual = jsonConvert.convert<int>(
      json['is_nomal_virtual']);
  if (isNomalVirtual != null) {
    collectItemGoods.isNomalVirtual = isNomalVirtual;
  }
  final int? marketable = jsonConvert.convert<int>(json['marketable']);
  if (marketable != null) {
    collectItemGoods.marketable = marketable;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    collectItemGoods.stock = stock;
  }
  final int? freezeStock = jsonConvert.convert<int>(json['freeze_stock']);
  if (freezeStock != null) {
    collectItemGoods.freezeStock = freezeStock;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    collectItemGoods.weight = weight;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    collectItemGoods.unit = unit;
  }
  final String? intro = jsonConvert.convert<String>(json['intro']);
  if (intro != null) {
    collectItemGoods.intro = intro;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    collectItemGoods.spesDesc = spesDesc;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    collectItemGoods.params = params;
  }
  final int? commentsCount = jsonConvert.convert<int>(json['comments_count']);
  if (commentsCount != null) {
    collectItemGoods.commentsCount = commentsCount;
  }
  final int? viewCount = jsonConvert.convert<int>(json['view_count']);
  if (viewCount != null) {
    collectItemGoods.viewCount = viewCount;
  }
  final int? buyCount = jsonConvert.convert<int>(json['buy_count']);
  if (buyCount != null) {
    collectItemGoods.buyCount = buyCount;
  }
  final dynamic uptime = json['uptime'];
  if (uptime != null) {
    collectItemGoods.uptime = uptime;
  }
  final dynamic downtime = json['downtime'];
  if (downtime != null) {
    collectItemGoods.downtime = downtime;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    collectItemGoods.sort = sort;
  }
  final int? isRecommend = jsonConvert.convert<int>(json['is_recommend']);
  if (isRecommend != null) {
    collectItemGoods.isRecommend = isRecommend;
  }
  final int? isHot = jsonConvert.convert<int>(json['is_hot']);
  if (isHot != null) {
    collectItemGoods.isHot = isHot;
  }
  final dynamic labelIds = json['label_ids'];
  if (labelIds != null) {
    collectItemGoods.labelIds = labelIds;
  }
  final String? newSpec = jsonConvert.convert<String>(json['new_spec']);
  if (newSpec != null) {
    collectItemGoods.newSpec = newSpec;
  }
  final dynamic ctime = json['ctime'];
  if (ctime != null) {
    collectItemGoods.ctime = ctime;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    collectItemGoods.utime = utime;
  }
  final int? isCombo = jsonConvert.convert<int>(json['is_combo']);
  if (isCombo != null) {
    collectItemGoods.isCombo = isCombo;
  }
  final int? categoryId = jsonConvert.convert<int>(json['category_id']);
  if (categoryId != null) {
    collectItemGoods.categoryId = categoryId;
  }
  final String? scoreSum = jsonConvert.convert<String>(json['score_sum']);
  if (scoreSum != null) {
    collectItemGoods.scoreSum = scoreSum;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    collectItemGoods.imageUrl = imageUrl;
  }
  return collectItemGoods;
}

Map<String, dynamic> $CollectItemGoodsToJson(CollectItemGoods entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bn'] = entity.bn;
  data['name'] = entity.name;
  data['brief'] = entity.brief;
  data['price'] = entity.price;
  data['costprice'] = entity.costprice;
  data['mktprice'] = entity.mktprice;
  data['image_id'] = entity.imageId;
  data['goods_cat_id'] = entity.goodsCatId;
  data['goods_type_id'] = entity.goodsTypeId;
  data['brand_id'] = entity.brandId;
  data['is_nomal_virtual'] = entity.isNomalVirtual;
  data['marketable'] = entity.marketable;
  data['stock'] = entity.stock;
  data['freeze_stock'] = entity.freezeStock;
  data['weight'] = entity.weight;
  data['unit'] = entity.unit;
  data['intro'] = entity.intro;
  data['spes_desc'] = entity.spesDesc;
  data['params'] = entity.params;
  data['comments_count'] = entity.commentsCount;
  data['view_count'] = entity.viewCount;
  data['buy_count'] = entity.buyCount;
  data['uptime'] = entity.uptime;
  data['downtime'] = entity.downtime;
  data['sort'] = entity.sort;
  data['is_recommend'] = entity.isRecommend;
  data['is_hot'] = entity.isHot;
  data['label_ids'] = entity.labelIds;
  data['new_spec'] = entity.newSpec;
  data['ctime'] = entity.ctime;
  data['utime'] = entity.utime;
  data['is_combo'] = entity.isCombo;
  data['category_id'] = entity.categoryId;
  data['score_sum'] = entity.scoreSum;
  data['image_url'] = entity.imageUrl;
  return data;
}

extension CollectItemGoodsExtension on CollectItemGoods {
  CollectItemGoods copyWith({
    int? id,
    String? bn,
    String? name,
    String? brief,
    String? price,
    String? costprice,
    String? mktprice,
    String? imageId,
    int? goodsCatId,
    int? goodsTypeId,
    int? brandId,
    int? isNomalVirtual,
    int? marketable,
    int? stock,
    int? freezeStock,
    String? weight,
    String? unit,
    String? intro,
    String? spesDesc,
    String? params,
    int? commentsCount,
    int? viewCount,
    int? buyCount,
    dynamic uptime,
    dynamic downtime,
    int? sort,
    int? isRecommend,
    int? isHot,
    dynamic labelIds,
    String? newSpec,
    dynamic ctime,
    int? utime,
    int? isCombo,
    int? categoryId,
    String? scoreSum,
    String? imageUrl,
  }) {
    return CollectItemGoods()
      ..id = id ?? this.id
      ..bn = bn ?? this.bn
      ..name = name ?? this.name
      ..brief = brief ?? this.brief
      ..price = price ?? this.price
      ..costprice = costprice ?? this.costprice
      ..mktprice = mktprice ?? this.mktprice
      ..imageId = imageId ?? this.imageId
      ..goodsCatId = goodsCatId ?? this.goodsCatId
      ..goodsTypeId = goodsTypeId ?? this.goodsTypeId
      ..brandId = brandId ?? this.brandId
      ..isNomalVirtual = isNomalVirtual ?? this.isNomalVirtual
      ..marketable = marketable ?? this.marketable
      ..stock = stock ?? this.stock
      ..freezeStock = freezeStock ?? this.freezeStock
      ..weight = weight ?? this.weight
      ..unit = unit ?? this.unit
      ..intro = intro ?? this.intro
      ..spesDesc = spesDesc ?? this.spesDesc
      ..params = params ?? this.params
      ..commentsCount = commentsCount ?? this.commentsCount
      ..viewCount = viewCount ?? this.viewCount
      ..buyCount = buyCount ?? this.buyCount
      ..uptime = uptime ?? this.uptime
      ..downtime = downtime ?? this.downtime
      ..sort = sort ?? this.sort
      ..isRecommend = isRecommend ?? this.isRecommend
      ..isHot = isHot ?? this.isHot
      ..labelIds = labelIds ?? this.labelIds
      ..newSpec = newSpec ?? this.newSpec
      ..ctime = ctime ?? this.ctime
      ..utime = utime ?? this.utime
      ..isCombo = isCombo ?? this.isCombo
      ..categoryId = categoryId ?? this.categoryId
      ..scoreSum = scoreSum ?? this.scoreSum
      ..imageUrl = imageUrl ?? this.imageUrl;
  }
}