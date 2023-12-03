import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/shop/bean/good_cat_bean_entity.dart';

GoodCatBeanEntity $GoodCatBeanEntityFromJson(Map<String, dynamic> json) {
  final GoodCatBeanEntity goodCatBeanEntity = GoodCatBeanEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodCatBeanEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodCatBeanEntity.name = name;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    goodCatBeanEntity.imageId = imageId;
  }
  final double? typeId = jsonConvert.convert<double>(json['type_id']);
  if (typeId != null) {
    goodCatBeanEntity.typeId = typeId;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    goodCatBeanEntity.image = image;
  }
  final List<GoodCatBeanChild>? child = (json['child'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<GoodCatBeanChild>(e) as GoodCatBeanChild)
      .toList();
  if (child != null) {
    goodCatBeanEntity.child = child;
  }
  final List<GoodCatBeanGoods>? goods = (json['goods'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<GoodCatBeanGoods>(e) as GoodCatBeanGoods)
      .toList();
  if (goods != null) {
    goodCatBeanEntity.goods = goods;
  }
  return goodCatBeanEntity;
}

Map<String, dynamic> $GoodCatBeanEntityToJson(GoodCatBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['image_id'] = entity.imageId;
  data['type_id'] = entity.typeId;
  data['image'] = entity.image;
  data['child'] = entity.child.map((v) => v.toJson()).toList();
  data['goods'] = entity.goods.map((v) => v.toJson()).toList();
  return data;
}

extension GoodCatBeanEntityExtension on GoodCatBeanEntity {
  GoodCatBeanEntity copyWith({
    int? id,
    String? name,
    String? imageId,
    double? typeId,
    String? image,
    List<GoodCatBeanChild>? child,
    List<GoodCatBeanGoods>? goods,
  }) {
    return GoodCatBeanEntity()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..imageId = imageId ?? this.imageId
      ..typeId = typeId ?? this.typeId
      ..image = image ?? this.image
      ..child = child ?? this.child
      ..goods = goods ?? this.goods;
  }
}

GoodCatBeanChild $GoodCatBeanChildFromJson(Map<String, dynamic> json) {
  final GoodCatBeanChild goodCatBeanChild = GoodCatBeanChild();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodCatBeanChild.id = id;
  }
  final double? parentId = jsonConvert.convert<double>(json['parent_id']);
  if (parentId != null) {
    goodCatBeanChild.parentId = parentId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodCatBeanChild.name = name;
  }
  final double? typeId = jsonConvert.convert<double>(json['type_id']);
  if (typeId != null) {
    goodCatBeanChild.typeId = typeId;
  }
  final double? sort = jsonConvert.convert<double>(json['sort']);
  if (sort != null) {
    goodCatBeanChild.sort = sort;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    goodCatBeanChild.imageId = imageId;
  }
  final double? status = jsonConvert.convert<double>(json['status']);
  if (status != null) {
    goodCatBeanChild.status = status;
  }
  final double? utime = jsonConvert.convert<double>(json['utime']);
  if (utime != null) {
    goodCatBeanChild.utime = utime;
  }
  final String? image = jsonConvert.convert<String>(json['image']);
  if (image != null) {
    goodCatBeanChild.image = image;
  }
  return goodCatBeanChild;
}

Map<String, dynamic> $GoodCatBeanChildToJson(GoodCatBeanChild entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['parent_id'] = entity.parentId;
  data['name'] = entity.name;
  data['type_id'] = entity.typeId;
  data['sort'] = entity.sort;
  data['image_id'] = entity.imageId;
  data['status'] = entity.status;
  data['utime'] = entity.utime;
  data['image'] = entity.image;
  return data;
}

extension GoodCatBeanChildExtension on GoodCatBeanChild {
  GoodCatBeanChild copyWith({
    int? id,
    double? parentId,
    String? name,
    double? typeId,
    double? sort,
    String? imageId,
    double? status,
    double? utime,
    String? image,
  }) {
    return GoodCatBeanChild()
      ..id = id ?? this.id
      ..parentId = parentId ?? this.parentId
      ..name = name ?? this.name
      ..typeId = typeId ?? this.typeId
      ..sort = sort ?? this.sort
      ..imageId = imageId ?? this.imageId
      ..status = status ?? this.status
      ..utime = utime ?? this.utime
      ..image = image ?? this.image;
  }
}

GoodCatBeanGoods $GoodCatBeanGoodsFromJson(Map<String, dynamic> json) {
  final GoodCatBeanGoods goodCatBeanGoods = GoodCatBeanGoods();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodCatBeanGoods.id = id;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    goodCatBeanGoods.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodCatBeanGoods.name = name;
  }
  final String? brief = jsonConvert.convert<String>(json['brief']);
  if (brief != null) {
    goodCatBeanGoods.brief = brief;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    goodCatBeanGoods.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    goodCatBeanGoods.mktprice = mktprice;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    goodCatBeanGoods.imageId = imageId;
  }
  final double? goodsCatId = jsonConvert.convert<double>(json['goods_cat_id']);
  if (goodsCatId != null) {
    goodCatBeanGoods.goodsCatId = goodsCatId;
  }
  final double? goodsTypeId = jsonConvert.convert<double>(
      json['goods_type_id']);
  if (goodsTypeId != null) {
    goodCatBeanGoods.goodsTypeId = goodsTypeId;
  }
  final double? brandId = jsonConvert.convert<double>(json['brand_id']);
  if (brandId != null) {
    goodCatBeanGoods.brandId = brandId;
  }
  final double? isNomalVirtual = jsonConvert.convert<double>(
      json['is_nomal_virtual']);
  if (isNomalVirtual != null) {
    goodCatBeanGoods.isNomalVirtual = isNomalVirtual;
  }
  final double? marketable = jsonConvert.convert<double>(json['marketable']);
  if (marketable != null) {
    goodCatBeanGoods.marketable = marketable;
  }
  final double? stock = jsonConvert.convert<double>(json['stock']);
  if (stock != null) {
    goodCatBeanGoods.stock = stock;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    goodCatBeanGoods.weight = weight;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    goodCatBeanGoods.unit = unit;
  }
  final String? intro = jsonConvert.convert<String>(json['intro']);
  if (intro != null) {
    goodCatBeanGoods.intro = intro;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    goodCatBeanGoods.spesDesc = spesDesc;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    goodCatBeanGoods.params = params;
  }
  final double? commentsCount = jsonConvert.convert<double>(
      json['comments_count']);
  if (commentsCount != null) {
    goodCatBeanGoods.commentsCount = commentsCount;
  }
  final double? viewCount = jsonConvert.convert<double>(json['view_count']);
  if (viewCount != null) {
    goodCatBeanGoods.viewCount = viewCount;
  }
  final double? buyCount = jsonConvert.convert<double>(json['buy_count']);
  if (buyCount != null) {
    goodCatBeanGoods.buyCount = buyCount;
  }
  final dynamic uptime = json['uptime'];
  if (uptime != null) {
    goodCatBeanGoods.uptime = uptime;
  }
  final dynamic downtime = json['downtime'];
  if (downtime != null) {
    goodCatBeanGoods.downtime = downtime;
  }
  final double? sort = jsonConvert.convert<double>(json['sort']);
  if (sort != null) {
    goodCatBeanGoods.sort = sort;
  }
  final double? isRecommend = jsonConvert.convert<double>(json['is_recommend']);
  if (isRecommend != null) {
    goodCatBeanGoods.isRecommend = isRecommend;
  }
  final double? isHot = jsonConvert.convert<double>(json['is_hot']);
  if (isHot != null) {
    goodCatBeanGoods.isHot = isHot;
  }
  final List<dynamic>? labelIds = (json['label_ids'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (labelIds != null) {
    goodCatBeanGoods.labelIds = labelIds;
  }
  final String? newSpec = jsonConvert.convert<String>(json['new_spec']);
  if (newSpec != null) {
    goodCatBeanGoods.newSpec = newSpec;
  }
  final dynamic ctime = json['ctime'];
  if (ctime != null) {
    goodCatBeanGoods.ctime = ctime;
  }
  final double? utime = jsonConvert.convert<double>(json['utime']);
  if (utime != null) {
    goodCatBeanGoods.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    goodCatBeanGoods.isdel = isdel;
  }
  final double? isCombo = jsonConvert.convert<double>(json['is_combo']);
  if (isCombo != null) {
    goodCatBeanGoods.isCombo = isCombo;
  }
  final double? categoryId = jsonConvert.convert<double>(json['category_id']);
  if (categoryId != null) {
    goodCatBeanGoods.categoryId = categoryId;
  }
  final String? scoreSum = jsonConvert.convert<String>(json['score_sum']);
  if (scoreSum != null) {
    goodCatBeanGoods.scoreSum = scoreSum;
  }
  final String? catName = jsonConvert.convert<String>(json['cat_name']);
  if (catName != null) {
    goodCatBeanGoods.catName = catName;
  }
  final String? home = jsonConvert.convert<String>(json['home']);
  if (home != null) {
    goodCatBeanGoods.home = home;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    goodCatBeanGoods.imageUrl = imageUrl;
  }
  final String? tags = jsonConvert.convert<String>(json['Tags']);
  if (tags != null) {
    goodCatBeanGoods.tags = tags;
  }
  final double? bai = jsonConvert.convert<double>(json['bai']);
  if (bai != null) {
    goodCatBeanGoods.bai = bai;
  }
  final GoodCatBeanGoodsProduct? product = jsonConvert.convert<
      GoodCatBeanGoodsProduct>(json['product']);
  if (product != null) {
    goodCatBeanGoods.product = product;
  }
  final List<String>? album = (json['album'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (album != null) {
    goodCatBeanGoods.album = album;
  }
  final bool? isfav = jsonConvert.convert<bool>(json['isfav']);
  if (isfav != null) {
    goodCatBeanGoods.isfav = isfav;
  }
  final List<GoodCatBeanGoodsCanshu>? canshu = (json['canshu'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<GoodCatBeanGoodsCanshu>(e) as GoodCatBeanGoodsCanshu)
      .toList();
  if (canshu != null) {
    goodCatBeanGoods.canshu = canshu;
  }
  final dynamic category = json['category'];
  if (category != null) {
    goodCatBeanGoods.category = category;
  }
  final GoodCatBeanGoodsBrand? brand = jsonConvert.convert<
      GoodCatBeanGoodsBrand>(json['brand']);
  if (brand != null) {
    goodCatBeanGoods.brand = brand;
  }
  return goodCatBeanGoods;
}

Map<String, dynamic> $GoodCatBeanGoodsToJson(GoodCatBeanGoods entity) {
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
  data['brand'] = entity.brand?.toJson();
  return data;
}

extension GoodCatBeanGoodsExtension on GoodCatBeanGoods {
  GoodCatBeanGoods copyWith({
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
    String? intro,
    String? spesDesc,
    String? params,
    double? commentsCount,
    double? viewCount,
    double? buyCount,
    dynamic uptime,
    dynamic downtime,
    double? sort,
    double? isRecommend,
    double? isHot,
    List<dynamic>? labelIds,
    String? newSpec,
    dynamic ctime,
    double? utime,
    dynamic isdel,
    double? isCombo,
    double? categoryId,
    String? scoreSum,
    String? catName,
    String? home,
    String? imageUrl,
    String? tags,
    double? bai,
    GoodCatBeanGoodsProduct? product,
    List<String>? album,
    bool? isfav,
    List<GoodCatBeanGoodsCanshu>? canshu,
    dynamic category,
    GoodCatBeanGoodsBrand? brand,
  }) {
    return GoodCatBeanGoods()
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
      ..category = category ?? this.category
      ..brand = brand ?? this.brand;
  }
}

GoodCatBeanGoodsProduct $GoodCatBeanGoodsProductFromJson(
    Map<String, dynamic> json) {
  final GoodCatBeanGoodsProduct goodCatBeanGoodsProduct = GoodCatBeanGoodsProduct();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodCatBeanGoodsProduct.id = id;
  }
  final double? goodsId = jsonConvert.convert<double>(json['goods_id']);
  if (goodsId != null) {
    goodCatBeanGoodsProduct.goodsId = goodsId;
  }
  final dynamic barcode = json['barcode'];
  if (barcode != null) {
    goodCatBeanGoodsProduct.barcode = barcode;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    goodCatBeanGoodsProduct.sn = sn;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    goodCatBeanGoodsProduct.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    goodCatBeanGoodsProduct.mktprice = mktprice;
  }
  final double? marketable = jsonConvert.convert<double>(json['marketable']);
  if (marketable != null) {
    goodCatBeanGoodsProduct.marketable = marketable;
  }
  final double? stock = jsonConvert.convert<double>(json['stock']);
  if (stock != null) {
    goodCatBeanGoodsProduct.stock = stock;
  }
  final dynamic spesDesc = json['spes_desc'];
  if (spesDesc != null) {
    goodCatBeanGoodsProduct.spesDesc = spesDesc;
  }
  final double? isDefalut = jsonConvert.convert<double>(json['is_defalut']);
  if (isDefalut != null) {
    goodCatBeanGoodsProduct.isDefalut = isDefalut;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    goodCatBeanGoodsProduct.imageId = imageId;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    goodCatBeanGoodsProduct.isdel = isdel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodCatBeanGoodsProduct.name = name;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    goodCatBeanGoodsProduct.bn = bn;
  }
  final String? imagePath = jsonConvert.convert<String>(json['image_path']);
  if (imagePath != null) {
    goodCatBeanGoodsProduct.imagePath = imagePath;
  }
  final double? totalStock = jsonConvert.convert<double>(json['total_stock']);
  if (totalStock != null) {
    goodCatBeanGoodsProduct.totalStock = totalStock;
  }
  final double? isCombo = jsonConvert.convert<double>(json['is_combo']);
  if (isCombo != null) {
    goodCatBeanGoodsProduct.isCombo = isCombo;
  }
  final List<dynamic>? gradePrice = (json['grade_price'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gradePrice != null) {
    goodCatBeanGoodsProduct.gradePrice = gradePrice;
  }
  final List<dynamic>? gradeInfo = (json['grade_info'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (gradeInfo != null) {
    goodCatBeanGoodsProduct.gradeInfo = gradeInfo;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    goodCatBeanGoodsProduct.amount = amount;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    goodCatBeanGoodsProduct.promotionList = promotionList;
  }
  final double? promotionAmount = jsonConvert.convert<double>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    goodCatBeanGoodsProduct.promotionAmount = promotionAmount;
  }
  return goodCatBeanGoodsProduct;
}

Map<String, dynamic> $GoodCatBeanGoodsProductToJson(
    GoodCatBeanGoodsProduct entity) {
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

extension GoodCatBeanGoodsProductExtension on GoodCatBeanGoodsProduct {
  GoodCatBeanGoodsProduct copyWith({
    int? id,
    double? goodsId,
    dynamic barcode,
    String? sn,
    String? price,
    String? mktprice,
    double? marketable,
    double? stock,
    dynamic spesDesc,
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
    return GoodCatBeanGoodsProduct()
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

GoodCatBeanGoodsCanshu $GoodCatBeanGoodsCanshuFromJson(
    Map<String, dynamic> json) {
  final GoodCatBeanGoodsCanshu goodCatBeanGoodsCanshu = GoodCatBeanGoodsCanshu();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodCatBeanGoodsCanshu.id = id;
  }
  final double? goodsId = jsonConvert.convert<double>(json['goods_id']);
  if (goodsId != null) {
    goodCatBeanGoodsCanshu.goodsId = goodsId;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    goodCatBeanGoodsCanshu.value = value;
  }
  final dynamic sort = json['sort'];
  if (sort != null) {
    goodCatBeanGoodsCanshu.sort = sort;
  }
  return goodCatBeanGoodsCanshu;
}

Map<String, dynamic> $GoodCatBeanGoodsCanshuToJson(
    GoodCatBeanGoodsCanshu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['value'] = entity.value;
  data['sort'] = entity.sort;
  return data;
}

extension GoodCatBeanGoodsCanshuExtension on GoodCatBeanGoodsCanshu {
  GoodCatBeanGoodsCanshu copyWith({
    int? id,
    double? goodsId,
    String? value,
    dynamic sort,
  }) {
    return GoodCatBeanGoodsCanshu()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..value = value ?? this.value
      ..sort = sort ?? this.sort;
  }
}

GoodCatBeanGoodsBrand $GoodCatBeanGoodsBrandFromJson(
    Map<String, dynamic> json) {
  final GoodCatBeanGoodsBrand goodCatBeanGoodsBrand = GoodCatBeanGoodsBrand();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    goodCatBeanGoodsBrand.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    goodCatBeanGoodsBrand.name = name;
  }
  final String? logo = jsonConvert.convert<String>(json['logo']);
  if (logo != null) {
    goodCatBeanGoodsBrand.logo = logo;
  }
  return goodCatBeanGoodsBrand;
}

Map<String, dynamic> $GoodCatBeanGoodsBrandToJson(
    GoodCatBeanGoodsBrand entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['logo'] = entity.logo;
  return data;
}

extension GoodCatBeanGoodsBrandExtension on GoodCatBeanGoodsBrand {
  GoodCatBeanGoodsBrand copyWith({
    int? id,
    String? name,
    String? logo,
  }) {
    return GoodCatBeanGoodsBrand()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..logo = logo ?? this.logo;
  }
}