import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/good_bean_entity.dart';

GoodBeanEntity $GoodBeanEntityFromJson(Map<String, dynamic> json) {
  final GoodBeanEntity goodBeanEntity = GoodBeanEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodBeanEntity.id = id;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    goodBeanEntity.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodBeanEntity.name = name;
  }
  final String? brief = jsonConvert.convert<String>(json['brief']);
  if (brief != null) {
    goodBeanEntity.brief = brief;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    goodBeanEntity.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    goodBeanEntity.mktprice = mktprice;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    goodBeanEntity.imageId = imageId;
  }
  final int? goodsCatId = jsonConvert.convert<int>(json['goods_cat_id']);
  if (goodsCatId != null) {
    goodBeanEntity.goodsCatId = goodsCatId;
  }
  final int? goodsTypeId = jsonConvert.convert<int>(json['goods_type_id']);
  if (goodsTypeId != null) {
    goodBeanEntity.goodsTypeId = goodsTypeId;
  }
  final int? brandId = jsonConvert.convert<int>(json['brand_id']);
  if (brandId != null) {
    goodBeanEntity.brandId = brandId;
  }
  final int? isNomalVirtual = jsonConvert.convert<int>(
      json['is_nomal_virtual']);
  if (isNomalVirtual != null) {
    goodBeanEntity.isNomalVirtual = isNomalVirtual;
  }
  final int? marketable = jsonConvert.convert<int>(json['marketable']);
  if (marketable != null) {
    goodBeanEntity.marketable = marketable;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    goodBeanEntity.stock = stock;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    goodBeanEntity.weight = weight;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    goodBeanEntity.unit = unit;
  }
  final String? intro = jsonConvert.convert<String>(json['intro']);
  if (intro != null) {
    goodBeanEntity.intro = intro;
  }
  final String? params = jsonConvert.convert<String>(json['spes_desc']);
  if (params != null) {
    goodBeanEntity.params = params;
  }
  final int? commentsCount = jsonConvert.convert<int>(json['comments_count']);
  if (commentsCount != null) {
    goodBeanEntity.commentsCount = commentsCount;
  }
  final int? viewCount = jsonConvert.convert<int>(json['view_count']);
  if (viewCount != null) {
    goodBeanEntity.viewCount = viewCount;
  }
  final int? buyCount = jsonConvert.convert<int>(json['buy_count']);
  if (buyCount != null) {
    goodBeanEntity.buyCount = buyCount;
  }
  final dynamic uptime = json['uptime'];
  if (uptime != null) {
    goodBeanEntity.uptime = uptime;
  }
  final dynamic downtime = json['downtime'];
  if (downtime != null) {
    goodBeanEntity.downtime = downtime;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    goodBeanEntity.sort = sort;
  }
  final int? isRecommend = jsonConvert.convert<int>(json['is_recommend']);
  if (isRecommend != null) {
    goodBeanEntity.isRecommend = isRecommend;
  }
  final int? isHot = jsonConvert.convert<int>(json['is_hot']);
  if (isHot != null) {
    goodBeanEntity.isHot = isHot;
  }
  final List<dynamic>? labelIds = (json['label_ids'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (labelIds != null) {
    goodBeanEntity.labelIds = labelIds;
  }
  final String? newSpec = jsonConvert.convert<String>(json['new_spec']);
  if (newSpec != null) {
    goodBeanEntity.newSpec = newSpec;
  }
  final dynamic ctime = json['ctime'];
  if (ctime != null) {
    goodBeanEntity.ctime = ctime;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    goodBeanEntity.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    goodBeanEntity.isdel = isdel;
  }
  final int? isCombo = jsonConvert.convert<int>(json['is_combo']);
  if (isCombo != null) {
    goodBeanEntity.isCombo = isCombo;
  }
  final int? categoryId = jsonConvert.convert<int>(json['category_id']);
  if (categoryId != null) {
    goodBeanEntity.categoryId = categoryId;
  }
  final String? scoreSum = jsonConvert.convert<String>(json['score_sum']);
  if (scoreSum != null) {
    goodBeanEntity.scoreSum = scoreSum;
  }
  final String? catName = jsonConvert.convert<String>(json['cat_name']);
  if (catName != null) {
    goodBeanEntity.catName = catName;
  }
  final String? home = jsonConvert.convert<String>(json['home']);
  if (home != null) {
    goodBeanEntity.home = home;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    goodBeanEntity.imageUrl = imageUrl;
  }
  final String? tags = jsonConvert.convert<String>(json['Tags']);
  if (tags != null) {
    goodBeanEntity.tags = tags;
  }
  final double? bai = jsonConvert.convert<double>(json['bai']);
  if (bai != null) {
    goodBeanEntity.bai = bai;
  }
  final GoodBeanProduct? product = jsonConvert.convert<GoodBeanProduct>(
      json['product']);
  if (product != null) {
    goodBeanEntity.product = product;
  }
  final List<String>? album = (json['album'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (album != null) {
    goodBeanEntity.album = album;
  }
  final bool? isfav = jsonConvert.convert<bool>(json['isfav']);
  if (isfav != null) {
    goodBeanEntity.isfav = isfav;
  }
  final List<GoodBeanCanshu>? canshu = (json['canshu'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<GoodBeanCanshu>(e) as GoodBeanCanshu)
      .toList();
  if (canshu != null) {
    goodBeanEntity.canshu = canshu;
  }
  final dynamic category = json['category'];
  if (category != null) {
    goodBeanEntity.category = category;
  }
  return goodBeanEntity;
}

Map<String, dynamic> $GoodBeanEntityToJson(GoodBeanEntity entity) {
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
  data['intro'] = entity.intro;
  data['spes_desc'] = entity.params;
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
  data['isdel'] = entity.isdel;
  data['is_combo'] = entity.isCombo;
  data['category_id'] = entity.categoryId;
  data['score_sum'] = entity.scoreSum;
  data['cat_name'] = entity.catName;
  data['home'] = entity.home;
  data['image_url'] = entity.imageUrl;
  data['Tags'] = entity.tags;
  data['bai'] = entity.bai;
  data['product'] = entity.product.toJson();
  data['album'] = entity.album;
  data['isfav'] = entity.isfav;
  data['canshu'] = entity.canshu.map((v) => v.toJson()).toList();
  data['category'] = entity.category;
  return data;
}

extension GoodBeanEntityExtension on GoodBeanEntity {
  GoodBeanEntity copyWith({
    int? id,
    String? bn,
    String? name,
    String? brief,
    String? price,
    String? mktprice,
    String? imageId,
    int? goodsCatId,
    int? goodsTypeId,
    int? brandId,
    int? isNomalVirtual,
    int? marketable,
    int? stock,
    String? weight,
    String? unit,
    String? intro,
    String? params,
    int? commentsCount,
    int? viewCount,
    int? buyCount,
    dynamic uptime,
    dynamic downtime,
    int? sort,
    int? isRecommend,
    int? isHot,
    List<dynamic>? labelIds,
    String? newSpec,
    dynamic ctime,
    int? utime,
    dynamic isdel,
    int? isCombo,
    int? categoryId,
    String? scoreSum,
    String? catName,
    String? home,
    String? imageUrl,
    String? tags,
    double? bai,
    GoodBeanProduct? product,
    List<String>? album,
    bool? isfav,
    List<GoodBeanCanshu>? canshu,
    dynamic category,
  }) {
    return GoodBeanEntity()
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
      ..intro = intro ?? this.intro
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
      ..isdel = isdel ?? this.isdel
      ..isCombo = isCombo ?? this.isCombo
      ..categoryId = categoryId ?? this.categoryId
      ..scoreSum = scoreSum ?? this.scoreSum
      ..catName = catName ?? this.catName
      ..home = home ?? this.home
      ..imageUrl = imageUrl ?? this.imageUrl
      ..tags = tags ?? this.tags
      ..bai = bai ?? this.bai
      ..product = product ?? this.product
      ..album = album ?? this.album
      ..isfav = isfav ?? this.isfav
      ..canshu = canshu ?? this.canshu
      ..category = category ?? this.category;
  }
}

GoodBeanProduct $GoodBeanProductFromJson(Map<String, dynamic> json) {
  final GoodBeanProduct goodBeanProduct = GoodBeanProduct();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodBeanProduct.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    goodBeanProduct.goodsId = goodsId;
  }
  final dynamic barcode = json['barcode'];
  if (barcode != null) {
    goodBeanProduct.barcode = barcode;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    goodBeanProduct.sn = sn;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    goodBeanProduct.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    goodBeanProduct.mktprice = mktprice;
  }
  final int? marketable = jsonConvert.convert<int>(json['marketable']);
  if (marketable != null) {
    goodBeanProduct.marketable = marketable;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    goodBeanProduct.stock = stock;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    goodBeanProduct.spesDesc = spesDesc;
  }
  final int? isDefalut = jsonConvert.convert<int>(json['is_defalut']);
  if (isDefalut != null) {
    goodBeanProduct.isDefalut = isDefalut;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    goodBeanProduct.imageId = imageId;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    goodBeanProduct.isdel = isdel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodBeanProduct.name = name;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    goodBeanProduct.bn = bn;
  }
  final String? imagePath = jsonConvert.convert<String>(json['image_path']);
  if (imagePath != null) {
    goodBeanProduct.imagePath = imagePath;
  }
  final int? totalStock = jsonConvert.convert<int>(json['total_stock']);
  if (totalStock != null) {
    goodBeanProduct.totalStock = totalStock;
  }
  final int? isCombo = jsonConvert.convert<int>(json['is_combo']);
  if (isCombo != null) {
    goodBeanProduct.isCombo = isCombo;
  }
  final List<dynamic>? gradePrice = (json['grade_price'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gradePrice != null) {
    goodBeanProduct.gradePrice = gradePrice;
  }
  final List<dynamic>? gradeInfo = (json['grade_info'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (gradeInfo != null) {
    goodBeanProduct.gradeInfo = gradeInfo;
  }
  final Map<String, dynamic>? defaultSpesDesc =
  (json['default_spes_desc'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(k, e));
  if (defaultSpesDesc != null) {
    goodBeanProduct.defaultSpesDesc = defaultSpesDesc;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    goodBeanProduct.amount = amount;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    goodBeanProduct.promotionList = promotionList;
  }
  final int? promotionAmount = jsonConvert.convert<int>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    goodBeanProduct.promotionAmount = promotionAmount;
  }
  return goodBeanProduct;
}

Map<String, dynamic> $GoodBeanProductToJson(GoodBeanProduct entity) {
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
  data['default_spes_desc'] = entity.defaultSpesDesc;
  data['amount'] = entity.amount;
  data['promotion_list'] = entity.promotionList;
  data['promotion_amount'] = entity.promotionAmount;
  return data;
}

extension GoodBeanProductExtension on GoodBeanProduct {
  GoodBeanProduct copyWith({
    int? id,
    int? goodsId,
    dynamic barcode,
    String? sn,
    String? price,
    String? mktprice,
    int? marketable,
    int? stock,
    String? spesDesc,
    int? isDefalut,
    String? imageId,
    dynamic isdel,
    String? name,
    String? bn,
    String? imagePath,
    int? totalStock,
    int? isCombo,
    List<dynamic>? gradePrice,
    List<dynamic>? gradeInfo,
    Map<String, dynamic>? defaultSpesDesc,
    String? amount,
    List<dynamic>? promotionList,
    int? promotionAmount,
  }) {
    return GoodBeanProduct()
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
      ..defaultSpesDesc = defaultSpesDesc ?? this.defaultSpesDesc
      ..amount = amount ?? this.amount
      ..promotionList = promotionList ?? this.promotionList
      ..promotionAmount = promotionAmount ?? this.promotionAmount;
  }
}

GoodBeanCanshu $GoodBeanCanshuFromJson(Map<String, dynamic> json) {
  final GoodBeanCanshu goodBeanCanshu = GoodBeanCanshu();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodBeanCanshu.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    goodBeanCanshu.goodsId = goodsId;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    goodBeanCanshu.value = value;
  }
  final dynamic sort = json['sort'];
  if (sort != null) {
    goodBeanCanshu.sort = sort;
  }
  return goodBeanCanshu;
}

Map<String, dynamic> $GoodBeanCanshuToJson(GoodBeanCanshu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['value'] = entity.value;
  data['sort'] = entity.sort;
  return data;
}

extension GoodBeanCanshuExtension on GoodBeanCanshu {
  GoodBeanCanshu copyWith({
    int? id,
    int? goodsId,
    String? value,
    dynamic sort,
  }) {
    return GoodBeanCanshu()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..value = value ?? this.value
      ..sort = sort ?? this.sort;
  }
}