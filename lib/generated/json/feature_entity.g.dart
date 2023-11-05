import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/feature_entity.dart';

FeatureEntity $FeatureEntityFromJson(Map<String, dynamic> json) {
  final FeatureEntity featureEntity = FeatureEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    featureEntity.id = id;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    featureEntity.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    featureEntity.name = name;
  }
  final String? brief = jsonConvert.convert<String>(json['brief']);
  if (brief != null) {
    featureEntity.brief = brief;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    featureEntity.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    featureEntity.mktprice = mktprice;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    featureEntity.imageId = imageId;
  }
  final double? goodsCatId = jsonConvert.convert<double>(json['goods_cat_id']);
  if (goodsCatId != null) {
    featureEntity.goodsCatId = goodsCatId;
  }
  final double? goodsTypeId = jsonConvert.convert<double>(
      json['goods_type_id']);
  if (goodsTypeId != null) {
    featureEntity.goodsTypeId = goodsTypeId;
  }
  final double? brandId = jsonConvert.convert<double>(json['brand_id']);
  if (brandId != null) {
    featureEntity.brandId = brandId;
  }
  final double? isNomalVirtual = jsonConvert.convert<double>(
      json['is_nomal_virtual']);
  if (isNomalVirtual != null) {
    featureEntity.isNomalVirtual = isNomalVirtual;
  }
  final double? marketable = jsonConvert.convert<double>(json['marketable']);
  if (marketable != null) {
    featureEntity.marketable = marketable;
  }
  final double? stock = jsonConvert.convert<double>(json['stock']);
  if (stock != null) {
    featureEntity.stock = stock;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    featureEntity.weight = weight;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    featureEntity.unit = unit;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    featureEntity.params = params;
  }
  final String? cat_name = jsonConvert.convert<String>(json['cat_name']);
  if (cat_name != null) {
    featureEntity.cat_name = cat_name;
  }
  final String? image_url = jsonConvert.convert<String>(json['image_url']);
  if (image_url != null) {
    featureEntity.image_url = image_url;
  }
  final double? commentsCount = jsonConvert.convert<double>(
      json['comments_count']);
  if (commentsCount != null) {
    featureEntity.commentsCount = commentsCount;
  }
  final double? viewCount = jsonConvert.convert<double>(json['view_count']);
  if (viewCount != null) {
    featureEntity.viewCount = viewCount;
  }
  final double? buyCount = jsonConvert.convert<double>(json['buy_count']);
  if (buyCount != null) {
    featureEntity.buyCount = buyCount;
  }
  final dynamic uptime = json['uptime'];
  if (uptime != null) {
    featureEntity.uptime = uptime;
  }
  final dynamic downtime = json['downtime'];
  if (downtime != null) {
    featureEntity.downtime = downtime;
  }
  final double? sort = jsonConvert.convert<double>(json['sort']);
  if (sort != null) {
    featureEntity.sort = sort;
  }
  final double? isRecommend = jsonConvert.convert<double>(json['is_recommend']);
  if (isRecommend != null) {
    featureEntity.isRecommend = isRecommend;
  }
  final double? isHot = jsonConvert.convert<double>(json['is_hot']);
  if (isHot != null) {
    featureEntity.isHot = isHot;
  }
  final List<dynamic>? labelIds = (json['label_ids'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (labelIds != null) {
    featureEntity.labelIds = labelIds;
  }
  final dynamic ctime = json['ctime'];
  if (ctime != null) {
    featureEntity.ctime = ctime;
  }
  final double? utime = jsonConvert.convert<double>(json['utime']);
  if (utime != null) {
    featureEntity.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    featureEntity.isdel = isdel;
  }
  final double? isCombo = jsonConvert.convert<double>(json['is_combo']);
  if (isCombo != null) {
    featureEntity.isCombo = isCombo;
  }
  final double? categoryId = jsonConvert.convert<double>(json['category_id']);
  if (categoryId != null) {
    featureEntity.categoryId = categoryId;
  }
  final String? scoreSum = jsonConvert.convert<String>(json['score_sum']);
  if (scoreSum != null) {
    featureEntity.scoreSum = scoreSum;
  }
  final FeatureProduct? product = jsonConvert.convert<FeatureProduct>(
      json['product']);
  if (product != null) {
    featureEntity.product = product;
  }
  final List<String>? album = (json['album'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (album != null) {
    featureEntity.album = album;
  }
  final bool? isfav = jsonConvert.convert<bool>(json['isfav']);
  if (isfav != null) {
    featureEntity.isfav = isfav;
  }
  final List<FeatureCanshu>? canshu = (json['canshu'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<FeatureCanshu>(e) as FeatureCanshu)
      .toList();
  if (canshu != null) {
    featureEntity.canshu = canshu;
  }
  final dynamic category = json['category'];
  if (category != null) {
    featureEntity.category = category;
  }
  return featureEntity;
}

Map<String, dynamic> $FeatureEntityToJson(FeatureEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bn'] = entity.bn;
  data['name'] = entity.name;
  data['brief'] = entity.brief;
  data['price'] = entity.price;
  data['mktprice'] = entity.mktprice;
  data['image_id'] = entity.imageId;
  data['goods_cat_id'] = entity.goodsCatId;
  data['goods_type_id'] = entity.goodsTypeId;
  data['brand_id'] = entity.brandId;
  data['is_nomal_virtual'] = entity.isNomalVirtual;
  data['marketable'] = entity.marketable;
  data['stock'] = entity.stock;
  data['weight'] = entity.weight;
  data['unit'] = entity.unit;
  data['params'] = entity.params;
  data['comments_count'] = entity.commentsCount;
  data['image_url'] = entity.image_url;
  data['cat_name'] = entity.cat_name;
  data['view_count'] = entity.viewCount;
  data['buy_count'] = entity.buyCount;
  data['uptime'] = entity.uptime;
  data['downtime'] = entity.downtime;
  data['sort'] = entity.sort;
  data['is_recommend'] = entity.isRecommend;
  data['is_hot'] = entity.isHot;
  data['label_ids'] = entity.labelIds;
  data['ctime'] = entity.ctime;
  data['utime'] = entity.utime;
  data['isdel'] = entity.isdel;
  data['is_combo'] = entity.isCombo;
  data['category_id'] = entity.categoryId;
  data['score_sum'] = entity.scoreSum;
  data['product'] = entity.product.toJson();
  data['album'] = entity.album;
  data['isfav'] = entity.isfav;
  data['canshu'] = entity.canshu.map((v) => v.toJson()).toList();
  data['category'] = entity.category;
  return data;
}

extension FeatureEntityExtension on FeatureEntity {
  FeatureEntity copyWith({
    int? id,
    String? bn,
    String? name,
    String? brief,
    String? price,
    String? mktprice,
    String? imageId,
    double? goodsCatId,
    double? goodsTypeId,
    double? brandId,
    double? isNomalVirtual,
    double? marketable,
    double? stock,
    String? weight,
    String? unit,
    String? params,
    double? commentsCount,
    double? viewCount,
    String? image_url,
    String? cat_name,
    double? buyCount,
    dynamic uptime,
    dynamic downtime,
    double? sort,
    double? isRecommend,
    double? isHot,
    List<dynamic>? labelIds,
    dynamic ctime,
    double? utime,
    dynamic isdel,
    double? isCombo,
    double? categoryId,
    String? scoreSum,
    FeatureProduct? product,
    List<String>? album,
    bool? isfav,
    List<FeatureCanshu>? canshu,
    dynamic category,
  }) {
    return FeatureEntity()
      ..id = id ?? this.id
      ..bn = bn ?? this.bn
      ..name = name ?? this.name
      ..brief = brief ?? this.brief
      ..price = price ?? this.price
      ..mktprice = mktprice ?? this.mktprice
      ..imageId = imageId ?? this.imageId
      ..goodsCatId = goodsCatId ?? this.goodsCatId
      ..goodsTypeId = goodsTypeId ?? this.goodsTypeId
      ..brandId = brandId ?? this.brandId
      ..isNomalVirtual = isNomalVirtual ?? this.isNomalVirtual
      ..marketable = marketable ?? this.marketable
      ..stock = stock ?? this.stock
      ..weight = weight ?? this.weight
      ..unit = unit ?? this.unit
      ..params = params ?? this.params
      ..commentsCount = commentsCount ?? this.commentsCount
      ..viewCount = viewCount ?? this.viewCount
      ..cat_name = cat_name ?? this.cat_name
      ..image_url = image_url ?? this.image_url
      ..buyCount = buyCount ?? this.buyCount
      ..uptime = uptime ?? this.uptime
      ..downtime = downtime ?? this.downtime
      ..sort = sort ?? this.sort
      ..isRecommend = isRecommend ?? this.isRecommend
      ..isHot = isHot ?? this.isHot
      ..labelIds = labelIds ?? this.labelIds
      ..ctime = ctime ?? this.ctime
      ..utime = utime ?? this.utime
      ..isdel = isdel ?? this.isdel
      ..isCombo = isCombo ?? this.isCombo
      ..categoryId = categoryId ?? this.categoryId
      ..scoreSum = scoreSum ?? this.scoreSum
      ..product = product ?? this.product
      ..album = album ?? this.album
      ..isfav = isfav ?? this.isfav
      ..canshu = canshu ?? this.canshu
      ..category = category ?? this.category;
  }
}

FeatureProduct $FeatureProductFromJson(Map<String, dynamic> json) {
  final FeatureProduct featureProduct = FeatureProduct();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    featureProduct.id = id;
  }
  final double? goodsId = jsonConvert.convert<double>(json['goods_id']);
  if (goodsId != null) {
    featureProduct.goodsId = goodsId;
  }
  final dynamic barcode = json['barcode'];
  if (barcode != null) {
    featureProduct.barcode = barcode;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    featureProduct.sn = sn;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    featureProduct.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    featureProduct.mktprice = mktprice;
  }
  final double? marketable = jsonConvert.convert<double>(json['marketable']);
  if (marketable != null) {
    featureProduct.marketable = marketable;
  }
  final double? stock = jsonConvert.convert<double>(json['stock']);
  if (stock != null) {
    featureProduct.stock = stock;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    featureProduct.spesDesc = spesDesc;
  }
  final double? isDefalut = jsonConvert.convert<double>(json['is_defalut']);
  if (isDefalut != null) {
    featureProduct.isDefalut = isDefalut;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    featureProduct.imageId = imageId;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    featureProduct.isdel = isdel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    featureProduct.name = name;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    featureProduct.bn = bn;
  }
  final String? imagePath = jsonConvert.convert<String>(json['image_path']);
  if (imagePath != null) {
    featureProduct.imagePath = imagePath;
  }
  final double? totalStock = jsonConvert.convert<double>(json['total_stock']);
  if (totalStock != null) {
    featureProduct.totalStock = totalStock;
  }
  final double? isCombo = jsonConvert.convert<double>(json['is_combo']);
  if (isCombo != null) {
    featureProduct.isCombo = isCombo;
  }
  final List<dynamic>? gradePrice = (json['grade_price'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gradePrice != null) {
    featureProduct.gradePrice = gradePrice;
  }
  final List<dynamic>? gradeInfo = (json['grade_info'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (gradeInfo != null) {
    featureProduct.gradeInfo = gradeInfo;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    featureProduct.amount = amount;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    featureProduct.promotionList = promotionList;
  }
  final double? promotionAmount = jsonConvert.convert<double>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    featureProduct.promotionAmount = promotionAmount;
  }
  return featureProduct;
}

Map<String, dynamic> $FeatureProductToJson(FeatureProduct entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['barcode'] = entity.barcode;
  data['sn'] = entity.sn;
  data['price'] = entity.price;
  data['mktprice'] = entity.mktprice;
  data['marketable'] = entity.marketable;
  data['stock'] = entity.stock;
  data['spes_desc'] = entity.spesDesc;
  data['is_defalut'] = entity.isDefalut;
  data['image_id'] = entity.imageId;
  data['isdel'] = entity.isdel;
  data['name'] = entity.name;
  data['bn'] = entity.bn;
  data['image_path'] = entity.imagePath;
  data['total_stock'] = entity.totalStock;
  data['is_combo'] = entity.isCombo;
  data['grade_price'] = entity.gradePrice;
  data['grade_info'] = entity.gradeInfo;
  data['amount'] = entity.amount;
  data['promotion_list'] = entity.promotionList;
  data['promotion_amount'] = entity.promotionAmount;
  return data;
}

extension FeatureProductExtension on FeatureProduct {
  FeatureProduct copyWith({
    int? id,
    double? goodsId,
    dynamic barcode,
    String? sn,
    String? price,
    String? mktprice,
    double? marketable,
    double? stock,
    String? spesDesc,
    double? isDefalut,
    String? imageId,
    dynamic isdel,
    String? name,
    String? bn,
    String? imagePath,
    double? totalStock,
    double? isCombo,
    List<dynamic>? gradePrice,
    List<dynamic>? gradeInfo,
    String? amount,
    List<dynamic>? promotionList,
    double? promotionAmount,
  }) {
    return FeatureProduct()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..barcode = barcode ?? this.barcode
      ..sn = sn ?? this.sn
      ..price = price ?? this.price
      ..mktprice = mktprice ?? this.mktprice
      ..marketable = marketable ?? this.marketable
      ..stock = stock ?? this.stock
      ..spesDesc = spesDesc ?? this.spesDesc
      ..isDefalut = isDefalut ?? this.isDefalut
      ..imageId = imageId ?? this.imageId
      ..isdel = isdel ?? this.isdel
      ..name = name ?? this.name
      ..bn = bn ?? this.bn
      ..imagePath = imagePath ?? this.imagePath
      ..totalStock = totalStock ?? this.totalStock
      ..isCombo = isCombo ?? this.isCombo
      ..gradePrice = gradePrice ?? this.gradePrice
      ..gradeInfo = gradeInfo ?? this.gradeInfo
      ..amount = amount ?? this.amount
      ..promotionList = promotionList ?? this.promotionList
      ..promotionAmount = promotionAmount ?? this.promotionAmount;
  }
}

FeatureCanshu $FeatureCanshuFromJson(Map<String, dynamic> json) {
  final FeatureCanshu featureCanshu = FeatureCanshu();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    featureCanshu.id = id;
  }
  final double? goodsId = jsonConvert.convert<double>(json['goods_id']);
  if (goodsId != null) {
    featureCanshu.goodsId = goodsId;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    featureCanshu.value = value;
  }
  final dynamic sort = json['sort'];
  if (sort != null) {
    featureCanshu.sort = sort;
  }
  return featureCanshu;
}

Map<String, dynamic> $FeatureCanshuToJson(FeatureCanshu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['value'] = entity.value;
  data['sort'] = entity.sort;
  return data;
}

extension FeatureCanshuExtension on FeatureCanshu {
  FeatureCanshu copyWith({
    int? id,
    double? goodsId,
    String? value,
    dynamic sort,
  }) {
    return FeatureCanshu()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..value = value ?? this.value
      ..sort = sort ?? this.sort;
  }
}