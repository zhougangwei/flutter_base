import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/promotion_bean_entity.dart';

PromotionBeanEntity $PromotionBeanEntityFromJson(Map<String, dynamic> json) {
  final PromotionBeanEntity promotionBeanEntity = PromotionBeanEntity();
  final List<PromotionBeanList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PromotionBeanList>(e) as PromotionBeanList)
      .toList();
  if (list != null) {
    promotionBeanEntity.list = list;
  }
  final int? totalPage = jsonConvert.convert<int>(json['total_page']);
  if (totalPage != null) {
    promotionBeanEntity.totalPage = totalPage;
  }
  return promotionBeanEntity;
}

Map<String, dynamic> $PromotionBeanEntityToJson(PromotionBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['total_page'] = entity.totalPage;
  return data;
}

extension PromotionBeanEntityExtension on PromotionBeanEntity {
  PromotionBeanEntity copyWith({
    List<PromotionBeanList>? list,
    int? totalPage,
  }) {
    return PromotionBeanEntity()
      ..list = list ?? this.list
      ..totalPage = totalPage ?? this.totalPage;
  }
}

PromotionBeanList $PromotionBeanListFromJson(Map<String, dynamic> json) {
  final PromotionBeanList promotionBeanList = PromotionBeanList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    promotionBeanList.id = id;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    promotionBeanList.imageId = imageId;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    promotionBeanList.code = code;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    promotionBeanList.params = params;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    promotionBeanList.image = image;
  }
  final List<PromotionBeanListChild>? child = (json['child'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PromotionBeanListChild>(e) as PromotionBeanListChild)
      .toList();
  if (child != null) {
    promotionBeanList.child = child;
  }
  return promotionBeanList;
}

Map<String, dynamic> $PromotionBeanListToJson(PromotionBeanList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['image_id'] = entity.imageId;
  data['code'] = entity.code;
  data['params'] = entity.params;
  data['image'] = entity.image;
  data['child'] = entity.child.map((v) => v.toJson()).toList();
  return data;
}

extension PromotionBeanListExtension on PromotionBeanList {
  PromotionBeanList copyWith({
    int? id,
    String? imageId,
    String? code,
    String? params,
    String? image,
    List<PromotionBeanListChild>? child,
  }) {
    return PromotionBeanList()
      ..id = id ?? this.id
      ..imageId = imageId ?? this.imageId
      ..code = code ?? this.code
      ..params = params ?? this.params
      ..image = image ?? this.image
      ..child = child ?? this.child;
  }
}

PromotionBeanListChild $PromotionBeanListChildFromJson(
    Map<String, dynamic> json) {
  final PromotionBeanListChild promotionBeanListChild = PromotionBeanListChild();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    promotionBeanListChild.id = id;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    promotionBeanListChild.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    promotionBeanListChild.name = name;
  }
  final String? brief = jsonConvert.convert<String>(json['brief']);
  if (brief != null) {
    promotionBeanListChild.brief = brief;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    promotionBeanListChild.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    promotionBeanListChild.mktprice = mktprice;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    promotionBeanListChild.imageId = imageId;
  }
  final int? goodsCatId = jsonConvert.convert<int>(json['goods_cat_id']);
  if (goodsCatId != null) {
    promotionBeanListChild.goodsCatId = goodsCatId;
  }
  final int? goodsTypeId = jsonConvert.convert<int>(json['goods_type_id']);
  if (goodsTypeId != null) {
    promotionBeanListChild.goodsTypeId = goodsTypeId;
  }
  final int? brandId = jsonConvert.convert<int>(json['brand_id']);
  if (brandId != null) {
    promotionBeanListChild.brandId = brandId;
  }
  final int? isNomalVirtual = jsonConvert.convert<int>(
      json['is_nomal_virtual']);
  if (isNomalVirtual != null) {
    promotionBeanListChild.isNomalVirtual = isNomalVirtual;
  }
  final int? marketable = jsonConvert.convert<int>(json['marketable']);
  if (marketable != null) {
    promotionBeanListChild.marketable = marketable;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    promotionBeanListChild.stock = stock;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    promotionBeanListChild.weight = weight;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    promotionBeanListChild.unit = unit;
  }
  final String? intro = jsonConvert.convert<String>(json['intro']);
  if (intro != null) {
    promotionBeanListChild.intro = intro;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    promotionBeanListChild.spesDesc = spesDesc;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    promotionBeanListChild.params = params;
  }
  final int? commentsCount = jsonConvert.convert<int>(json['comments_count']);
  if (commentsCount != null) {
    promotionBeanListChild.commentsCount = commentsCount;
  }
  final int? viewCount = jsonConvert.convert<int>(json['view_count']);
  if (viewCount != null) {
    promotionBeanListChild.viewCount = viewCount;
  }
  final int? buyCount = jsonConvert.convert<int>(json['buy_count']);
  if (buyCount != null) {
    promotionBeanListChild.buyCount = buyCount;
  }
  final dynamic uptime = json['uptime'];
  if (uptime != null) {
    promotionBeanListChild.uptime = uptime;
  }
  final dynamic downtime = json['downtime'];
  if (downtime != null) {
    promotionBeanListChild.downtime = downtime;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    promotionBeanListChild.sort = sort;
  }
  final int? isRecommend = jsonConvert.convert<int>(json['is_recommend']);
  if (isRecommend != null) {
    promotionBeanListChild.isRecommend = isRecommend;
  }
  final int? isHot = jsonConvert.convert<int>(json['is_hot']);
  if (isHot != null) {
    promotionBeanListChild.isHot = isHot;
  }
  final List<dynamic>? labelIds = (json['label_ids'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (labelIds != null) {
    promotionBeanListChild.labelIds = labelIds;
  }
  final String? newSpec = jsonConvert.convert<String>(json['new_spec']);
  if (newSpec != null) {
    promotionBeanListChild.newSpec = newSpec;
  }
  final dynamic ctime = json['ctime'];
  if (ctime != null) {
    promotionBeanListChild.ctime = ctime;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    promotionBeanListChild.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    promotionBeanListChild.isdel = isdel;
  }
  final int? isCombo = jsonConvert.convert<int>(json['is_combo']);
  if (isCombo != null) {
    promotionBeanListChild.isCombo = isCombo;
  }
  final int? categoryId = jsonConvert.convert<int>(json['category_id']);
  if (categoryId != null) {
    promotionBeanListChild.categoryId = categoryId;
  }
  final String? scoreSum = jsonConvert.convert<String>(json['score_sum']);
  if (scoreSum != null) {
    promotionBeanListChild.scoreSum = scoreSum;
  }
  final String? catName = jsonConvert.convert<String>(json['cat_name']);
  if (catName != null) {
    promotionBeanListChild.catName = catName;
  }
  final String? home = jsonConvert.convert<String>(json['home']);
  if (home != null) {
    promotionBeanListChild.home = home;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    promotionBeanListChild.imageUrl = imageUrl;
  }
  final String? tags = jsonConvert.convert<String>(json['Tags']);
  if (tags != null) {
    promotionBeanListChild.tags = tags;
  }
  final int? bai = jsonConvert.convert<int>(json['bai']);
  if (bai != null) {
    promotionBeanListChild.bai = bai;
  }
  final PromotionBeanListChildProduct? product = jsonConvert.convert<
      PromotionBeanListChildProduct>(json['product']);
  if (product != null) {
    promotionBeanListChild.product = product;
  }
  final List<String>? album = (json['album'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (album != null) {
    promotionBeanListChild.album = album;
  }
  final bool? isfav = jsonConvert.convert<bool>(json['isfav']);
  if (isfav != null) {
    promotionBeanListChild.isfav = isfav;
  }
  final List<PromotionBeanListChildCanshu>? canshu = (json['canshu'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<PromotionBeanListChildCanshu>(
          e) as PromotionBeanListChildCanshu).toList();
  if (canshu != null) {
    promotionBeanListChild.canshu = canshu;
  }
  final dynamic category = json['category'];
  if (category != null) {
    promotionBeanListChild.category = category;
  }
  return promotionBeanListChild;
}

Map<String, dynamic> $PromotionBeanListChildToJson(
    PromotionBeanListChild entity) {
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

extension PromotionBeanListChildExtension on PromotionBeanListChild {
  PromotionBeanListChild copyWith({
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
    int? bai,
    PromotionBeanListChildProduct? product,
    List<String>? album,
    bool? isfav,
    List<PromotionBeanListChildCanshu>? canshu,
    dynamic category,
  }) {
    return PromotionBeanListChild()
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

PromotionBeanListChildProduct $PromotionBeanListChildProductFromJson(
    Map<String, dynamic> json) {
  final PromotionBeanListChildProduct promotionBeanListChildProduct = PromotionBeanListChildProduct();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    promotionBeanListChildProduct.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    promotionBeanListChildProduct.goodsId = goodsId;
  }
  final dynamic barcode = json['barcode'];
  if (barcode != null) {
    promotionBeanListChildProduct.barcode = barcode;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    promotionBeanListChildProduct.sn = sn;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    promotionBeanListChildProduct.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    promotionBeanListChildProduct.mktprice = mktprice;
  }
  final int? marketable = jsonConvert.convert<int>(json['marketable']);
  if (marketable != null) {
    promotionBeanListChildProduct.marketable = marketable;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    promotionBeanListChildProduct.stock = stock;
  }
  final dynamic spesDesc = json['spes_desc'];
  if (spesDesc != null) {
    promotionBeanListChildProduct.spesDesc = spesDesc;
  }
  final int? isDefalut = jsonConvert.convert<int>(json['is_defalut']);
  if (isDefalut != null) {
    promotionBeanListChildProduct.isDefalut = isDefalut;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    promotionBeanListChildProduct.imageId = imageId;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    promotionBeanListChildProduct.isdel = isdel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    promotionBeanListChildProduct.name = name;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    promotionBeanListChildProduct.bn = bn;
  }
  final String? imagePath = jsonConvert.convert<String>(json['image_path']);
  if (imagePath != null) {
    promotionBeanListChildProduct.imagePath = imagePath;
  }
  final int? totalStock = jsonConvert.convert<int>(json['total_stock']);
  if (totalStock != null) {
    promotionBeanListChildProduct.totalStock = totalStock;
  }
  final int? isCombo = jsonConvert.convert<int>(json['is_combo']);
  if (isCombo != null) {
    promotionBeanListChildProduct.isCombo = isCombo;
  }
  final List<dynamic>? gradePrice = (json['grade_price'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gradePrice != null) {
    promotionBeanListChildProduct.gradePrice = gradePrice;
  }
  final List<dynamic>? gradeInfo = (json['grade_info'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (gradeInfo != null) {
    promotionBeanListChildProduct.gradeInfo = gradeInfo;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    promotionBeanListChildProduct.amount = amount;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    promotionBeanListChildProduct.promotionList = promotionList;
  }
  final int? promotionAmount = jsonConvert.convert<int>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    promotionBeanListChildProduct.promotionAmount = promotionAmount;
  }
  return promotionBeanListChildProduct;
}

Map<String, dynamic> $PromotionBeanListChildProductToJson(
    PromotionBeanListChildProduct entity) {
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

extension PromotionBeanListChildProductExtension on PromotionBeanListChildProduct {
  PromotionBeanListChildProduct copyWith({
    int? id,
    int? goodsId,
    dynamic barcode,
    String? sn,
    String? price,
    String? mktprice,
    int? marketable,
    int? stock,
    dynamic spesDesc,
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
    String? amount,
    List<dynamic>? promotionList,
    int? promotionAmount,
  }) {
    return PromotionBeanListChildProduct()
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

PromotionBeanListChildCanshu $PromotionBeanListChildCanshuFromJson(
    Map<String, dynamic> json) {
  final PromotionBeanListChildCanshu promotionBeanListChildCanshu = PromotionBeanListChildCanshu();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    promotionBeanListChildCanshu.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    promotionBeanListChildCanshu.goodsId = goodsId;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    promotionBeanListChildCanshu.value = value;
  }
  final dynamic sort = json['sort'];
  if (sort != null) {
    promotionBeanListChildCanshu.sort = sort;
  }
  return promotionBeanListChildCanshu;
}

Map<String, dynamic> $PromotionBeanListChildCanshuToJson(
    PromotionBeanListChildCanshu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['value'] = entity.value;
  data['sort'] = entity.sort;
  return data;
}

extension PromotionBeanListChildCanshuExtension on PromotionBeanListChildCanshu {
  PromotionBeanListChildCanshu copyWith({
    int? id,
    int? goodsId,
    String? value,
    dynamic sort,
  }) {
    return PromotionBeanListChildCanshu()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..value = value ?? this.value
      ..sort = sort ?? this.sort;
  }
}