import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/page_bean_entity.dart';

PageBeanEntity $PageBeanEntityFromJson(Map<String, dynamic> json) {
  final PageBeanEntity pageBeanEntity = PageBeanEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pageBeanEntity.name = name;
  }
  final List<PageBeanChild>? child = (json['child'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PageBeanChild>(e) as PageBeanChild)
      .toList();
  if (child != null) {
    pageBeanEntity.child = child;
  }
  return pageBeanEntity;
}

Map<String, dynamic> $PageBeanEntityToJson(PageBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['child'] = entity.child.map((v) => v.toJson()).toList();
  return data;
}

extension PageBeanEntityExtension on PageBeanEntity {
  PageBeanEntity copyWith({
    String? name,
    List<PageBeanChild>? child,
  }) {
    return PageBeanEntity()
      ..name = name ?? this.name
      ..child = child ?? this.child;
  }
}

PageBeanChild $PageBeanChildFromJson(Map<String, dynamic> json) {
  final PageBeanChild pageBeanChild = PageBeanChild();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pageBeanChild.id = id;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    pageBeanChild.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pageBeanChild.name = name;
  }
  final String? brief = jsonConvert.convert<String>(json['brief']);
  if (brief != null) {
    pageBeanChild.brief = brief;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    pageBeanChild.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    pageBeanChild.mktprice = mktprice;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    pageBeanChild.imageId = imageId;
  }
  final double? goodsCatId = jsonConvert.convert<double>(json['goods_cat_id']);
  if (goodsCatId != null) {
    pageBeanChild.goodsCatId = goodsCatId;
  }
  final double? goodsTypeId = jsonConvert.convert<double>(
      json['goods_type_id']);
  if (goodsTypeId != null) {
    pageBeanChild.goodsTypeId = goodsTypeId;
  }
  final double? brandId = jsonConvert.convert<double>(json['brand_id']);
  if (brandId != null) {
    pageBeanChild.brandId = brandId;
  }
  final double? isNomalVirtual = jsonConvert.convert<double>(
      json['is_nomal_virtual']);
  if (isNomalVirtual != null) {
    pageBeanChild.isNomalVirtual = isNomalVirtual;
  }
  final double? marketable = jsonConvert.convert<double>(json['marketable']);
  if (marketable != null) {
    pageBeanChild.marketable = marketable;
  }
  final double? stock = jsonConvert.convert<double>(json['stock']);
  if (stock != null) {
    pageBeanChild.stock = stock;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    pageBeanChild.weight = weight;
  }
  final String? unit = jsonConvert.convert<String>(json['unit']);
  if (unit != null) {
    pageBeanChild.unit = unit;
  }
  final String? intro = jsonConvert.convert<String>(json['intro']);
  if (intro != null) {
    pageBeanChild.intro = intro;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    pageBeanChild.spesDesc = spesDesc;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    pageBeanChild.params = params;
  }
  final double? commentsCount = jsonConvert.convert<double>(
      json['comments_count']);
  if (commentsCount != null) {
    pageBeanChild.commentsCount = commentsCount;
  }
  final double? viewCount = jsonConvert.convert<double>(json['view_count']);
  if (viewCount != null) {
    pageBeanChild.viewCount = viewCount;
  }
  final double? buyCount = jsonConvert.convert<double>(json['buy_count']);
  if (buyCount != null) {
    pageBeanChild.buyCount = buyCount;
  }
  final dynamic uptime = json['uptime'];
  if (uptime != null) {
    pageBeanChild.uptime = uptime;
  }
  final dynamic downtime = json['downtime'];
  if (downtime != null) {
    pageBeanChild.downtime = downtime;
  }
  final double? sort = jsonConvert.convert<double>(json['sort']);
  if (sort != null) {
    pageBeanChild.sort = sort;
  }
  final double? isRecommend = jsonConvert.convert<double>(json['is_recommend']);
  if (isRecommend != null) {
    pageBeanChild.isRecommend = isRecommend;
  }
  final double? isHot = jsonConvert.convert<double>(json['is_hot']);
  if (isHot != null) {
    pageBeanChild.isHot = isHot;
  }
  final List<dynamic>? labelIds = (json['label_ids'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (labelIds != null) {
    pageBeanChild.labelIds = labelIds;
  }
  final String? newSpec = jsonConvert.convert<String>(json['new_spec']);
  if (newSpec != null) {
    pageBeanChild.newSpec = newSpec;
  }
  final dynamic ctime = json['ctime'];
  if (ctime != null) {
    pageBeanChild.ctime = ctime;
  }
  final double? utime = jsonConvert.convert<double>(json['utime']);
  if (utime != null) {
    pageBeanChild.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    pageBeanChild.isdel = isdel;
  }
  final double? isCombo = jsonConvert.convert<double>(json['is_combo']);
  if (isCombo != null) {
    pageBeanChild.isCombo = isCombo;
  }
  final double? categoryId = jsonConvert.convert<double>(json['category_id']);
  if (categoryId != null) {
    pageBeanChild.categoryId = categoryId;
  }
  final String? scoreSum = jsonConvert.convert<String>(json['score_sum']);
  if (scoreSum != null) {
    pageBeanChild.scoreSum = scoreSum;
  }
  final String? catName = jsonConvert.convert<String>(json['cat_name']);
  if (catName != null) {
    pageBeanChild.catName = catName;
  }
  final String? home = jsonConvert.convert<String>(json['home']);
  if (home != null) {
    pageBeanChild.home = home;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    pageBeanChild.imageUrl = imageUrl;
  }
  final String? tags = jsonConvert.convert<String>(json['Tags']);
  if (tags != null) {
    pageBeanChild.tags = tags;
  }
  final double? bai = jsonConvert.convert<double>(json['bai']);
  if (bai != null) {
    pageBeanChild.bai = bai;
  }
  final PageBeanChildProduct? product = jsonConvert.convert<
      PageBeanChildProduct>(json['product']);
  if (product != null) {
    pageBeanChild.product = product;
  }
  final List<String>? album = (json['album'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (album != null) {
    pageBeanChild.album = album;
  }
  final bool? isfav = jsonConvert.convert<bool>(json['isfav']);
  if (isfav != null) {
    pageBeanChild.isfav = isfav;
  }
  final List<PageBeanChildCanshu>? canshu = (json['canshu'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PageBeanChildCanshu>(e) as PageBeanChildCanshu)
      .toList();
  if (canshu != null) {
    pageBeanChild.canshu = canshu;
  }
  final dynamic category = json['category'];
  if (category != null) {
    pageBeanChild.category = category;
  }
  return pageBeanChild;
}

Map<String, dynamic> $PageBeanChildToJson(PageBeanChild entity) {
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

extension PageBeanChildExtension on PageBeanChild {
  PageBeanChild copyWith({
    double? id,
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
    PageBeanChildProduct? product,
    List<String>? album,
    bool? isfav,
    List<PageBeanChildCanshu>? canshu,
    dynamic category,
  }) {
    return PageBeanChild()
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

PageBeanChildProduct $PageBeanChildProductFromJson(Map<String, dynamic> json) {
  final PageBeanChildProduct pageBeanChildProduct = PageBeanChildProduct();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pageBeanChildProduct.id = id;
  }
  final double? goodsId = jsonConvert.convert<double>(json['goods_id']);
  if (goodsId != null) {
    pageBeanChildProduct.goodsId = goodsId;
  }
  final dynamic barcode = json['barcode'];
  if (barcode != null) {
    pageBeanChildProduct.barcode = barcode;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    pageBeanChildProduct.sn = sn;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    pageBeanChildProduct.price = price;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    pageBeanChildProduct.mktprice = mktprice;
  }
  final double? marketable = jsonConvert.convert<double>(json['marketable']);
  if (marketable != null) {
    pageBeanChildProduct.marketable = marketable;
  }
  final double? stock = jsonConvert.convert<double>(json['stock']);
  if (stock != null) {
    pageBeanChildProduct.stock = stock;
  }
  final dynamic spesDesc = json['spes_desc'];
  if (spesDesc != null) {
    pageBeanChildProduct.spesDesc = spesDesc;
  }
  final double? isDefalut = jsonConvert.convert<double>(json['is_defalut']);
  if (isDefalut != null) {
    pageBeanChildProduct.isDefalut = isDefalut;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    pageBeanChildProduct.imageId = imageId;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    pageBeanChildProduct.isdel = isdel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pageBeanChildProduct.name = name;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    pageBeanChildProduct.bn = bn;
  }
  final String? imagePath = jsonConvert.convert<String>(json['image_path']);
  if (imagePath != null) {
    pageBeanChildProduct.imagePath = imagePath;
  }
  final double? totalStock = jsonConvert.convert<double>(json['total_stock']);
  if (totalStock != null) {
    pageBeanChildProduct.totalStock = totalStock;
  }
  final double? isCombo = jsonConvert.convert<double>(json['is_combo']);
  if (isCombo != null) {
    pageBeanChildProduct.isCombo = isCombo;
  }
  final List<dynamic>? gradePrice = (json['grade_price'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gradePrice != null) {
    pageBeanChildProduct.gradePrice = gradePrice;
  }
  final List<dynamic>? gradeInfo = (json['grade_info'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (gradeInfo != null) {
    pageBeanChildProduct.gradeInfo = gradeInfo;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    pageBeanChildProduct.amount = amount;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    pageBeanChildProduct.promotionList = promotionList;
  }
  final double? promotionAmount = jsonConvert.convert<double>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    pageBeanChildProduct.promotionAmount = promotionAmount;
  }
  return pageBeanChildProduct;
}

Map<String, dynamic> $PageBeanChildProductToJson(PageBeanChildProduct entity) {
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

extension PageBeanChildProductExtension on PageBeanChildProduct {
  PageBeanChildProduct copyWith({
    double? id,
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
    return PageBeanChildProduct()
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

PageBeanChildCanshu $PageBeanChildCanshuFromJson(Map<String, dynamic> json) {
  final PageBeanChildCanshu pageBeanChildCanshu = PageBeanChildCanshu();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    pageBeanChildCanshu.id = id;
  }
  final double? goodsId = jsonConvert.convert<double>(json['goods_id']);
  if (goodsId != null) {
    pageBeanChildCanshu.goodsId = goodsId;
  }
  final String? value = jsonConvert.convert<String>(json['value']);
  if (value != null) {
    pageBeanChildCanshu.value = value;
  }
  final dynamic sort = json['sort'];
  if (sort != null) {
    pageBeanChildCanshu.sort = sort;
  }
  return pageBeanChildCanshu;
}

Map<String, dynamic> $PageBeanChildCanshuToJson(PageBeanChildCanshu entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['value'] = entity.value;
  data['sort'] = entity.sort;
  return data;
}

extension PageBeanChildCanshuExtension on PageBeanChildCanshu {
  PageBeanChildCanshu copyWith({
    double? id,
    double? goodsId,
    String? value,
    dynamic sort,
  }) {
    return PageBeanChildCanshu()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..value = value ?? this.value
      ..sort = sort ?? this.sort;
  }
}