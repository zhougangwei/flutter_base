import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/cart_bean_entity.dart';

CartBeanEntity $CartBeanEntityFromJson(Map<String, dynamic> json) {
  final CartBeanEntity cartBeanEntity = CartBeanEntity();
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    cartBeanEntity.userId = userId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    cartBeanEntity.type = type;
  }
  final List<CartBeanList>? list = (json['list'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<CartBeanList>(e) as CartBeanList).toList();
  if (list != null) {
    cartBeanEntity.list = list;
  }
  final int? goodsAmount = jsonConvert.convert<int>(json['goods_amount']);
  if (goodsAmount != null) {
    cartBeanEntity.goodsAmount = goodsAmount;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    cartBeanEntity.amount = amount;
  }
  final int? orderPmt = jsonConvert.convert<int>(json['order_pmt']);
  if (orderPmt != null) {
    cartBeanEntity.orderPmt = orderPmt;
  }
  final int? goodsPmt = jsonConvert.convert<int>(json['goods_pmt']);
  if (goodsPmt != null) {
    cartBeanEntity.goodsPmt = goodsPmt;
  }
  final int? couponPmt = jsonConvert.convert<int>(json['coupon_pmt']);
  if (couponPmt != null) {
    cartBeanEntity.couponPmt = couponPmt;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    cartBeanEntity.promotionList = promotionList;
  }
  final String? costFreight = jsonConvert.convert<String>(json['cost_freight']);
  if (costFreight != null) {
    cartBeanEntity.costFreight = costFreight;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    cartBeanEntity.weight = weight;
  }
  final List<dynamic>? coupon = (json['coupon'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (coupon != null) {
    cartBeanEntity.coupon = coupon;
  }
  final int? point = jsonConvert.convert<int>(json['point']);
  if (point != null) {
    cartBeanEntity.point = point;
  }
  final int? pointMoney = jsonConvert.convert<int>(json['point_money']);
  if (pointMoney != null) {
    cartBeanEntity.pointMoney = pointMoney;
  }
  final List<dynamic>? params = (json['params'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (params != null) {
    cartBeanEntity.params = params;
  }
  return cartBeanEntity;
}

Map<String, dynamic> $CartBeanEntityToJson(CartBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['user_id'] = entity.userId;
  data['type'] = entity.type;
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['goods_amount'] = entity.goodsAmount;
  data['amount'] = entity.amount;
  data['order_pmt'] = entity.orderPmt;
  data['goods_pmt'] = entity.goodsPmt;
  data['coupon_pmt'] = entity.couponPmt;
  data['promotion_list'] = entity.promotionList;
  data['cost_freight'] = entity.costFreight;
  data['weight'] = entity.weight;
  data['coupon'] = entity.coupon;
  data['point'] = entity.point;
  data['point_money'] = entity.pointMoney;
  data['params'] = entity.params;
  return data;
}

extension CartBeanEntityExtension on CartBeanEntity {
  CartBeanEntity copyWith({
    int? userId,
    int? type,
    List<CartBeanList>? list,
    int? goodsAmount,
    String? amount,
    int? orderPmt,
    int? goodsPmt,
    int? couponPmt,
    List<dynamic>? promotionList,
    String? costFreight,
    int? weight,
    List<dynamic>? coupon,
    int? point,
    int? pointMoney,
    List<dynamic>? params,
  }) {
    return CartBeanEntity()
      ..userId = userId ?? this.userId
      ..type = type ?? this.type
      ..list = list ?? this.list
      ..goodsAmount = goodsAmount ?? this.goodsAmount
      ..amount = amount ?? this.amount
      ..orderPmt = orderPmt ?? this.orderPmt
      ..goodsPmt = goodsPmt ?? this.goodsPmt
      ..couponPmt = couponPmt ?? this.couponPmt
      ..promotionList = promotionList ?? this.promotionList
      ..costFreight = costFreight ?? this.costFreight
      ..weight = weight ?? this.weight
      ..coupon = coupon ?? this.coupon
      ..point = point ?? this.point
      ..pointMoney = pointMoney ?? this.pointMoney
      ..params = params ?? this.params;
  }
}

CartBeanList $CartBeanListFromJson(Map<String, dynamic> json) {
  final CartBeanList cartBeanList = CartBeanList();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    cartBeanList.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    cartBeanList.userId = userId;
  }
  final int? productId = jsonConvert.convert<int>(json['product_id']);
  if (productId != null) {
    cartBeanList.productId = productId;
  }
  final int? nums = jsonConvert.convert<int>(json['nums']);
  if (nums != null) {
    cartBeanList.nums = nums;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    cartBeanList.type = type;
  }
  final CartBeanListAddress? address = jsonConvert.convert<CartBeanListAddress>(
      json['address']);
  if (address != null) {
    cartBeanList.address = address;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    cartBeanList.weight = weight;
  }
  final CartBeanListProducts? products = jsonConvert.convert<
      CartBeanListProducts>(json['products']);
  if (products != null) {
    cartBeanList.products = products;
  }
  final bool? isSelect = jsonConvert.convert<bool>(json['is_select']);
  if (isSelect != null) {
    cartBeanList.isSelect = isSelect;
  }
  final bool? isCollection = jsonConvert.convert<bool>(json['isCollection']);
  if (isCollection != null) {
    cartBeanList.isCollection = isCollection;
  }
  final bool? checked = jsonConvert.convert<bool>(json['checked']);
  if (checked != null) {
    cartBeanList.checked = checked;
  }
  return cartBeanList;
}

Map<String, dynamic> $CartBeanListToJson(CartBeanList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['product_id'] = entity.productId;
  data['nums'] = entity.nums;
  data['type'] = entity.type;
  data['address'] = entity.address.toJson();
  data['weight'] = entity.weight;
  data['products'] = entity.products.toJson();
  data['is_select'] = entity.isSelect;
  data['isCollection'] = entity.isCollection;
  data['checked'] = entity.checked;
  return data;
}

extension CartBeanListExtension on CartBeanList {
  CartBeanList copyWith({
    int? id,
    int? userId,
    int? productId,
    int? nums,
    int? type,
    CartBeanListAddress? address,
    String? weight,
    CartBeanListProducts? products,
    bool? isSelect,
    bool? isCollection,
    bool? checked,
  }) {
    return CartBeanList()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..productId = productId ?? this.productId
      ..nums = nums ?? this.nums
      ..type = type ?? this.type
      ..address = address ?? this.address
      ..weight = weight ?? this.weight
      ..products = products ?? this.products
      ..isSelect = isSelect ?? this.isSelect
      ..isCollection = isCollection ?? this.isCollection
      ..checked = checked ?? this.checked;
  }
}

CartBeanListAddress $CartBeanListAddressFromJson(Map<String, dynamic> json) {
  final CartBeanListAddress cartBeanListAddress = CartBeanListAddress();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    cartBeanListAddress.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    cartBeanListAddress.userId = userId;
  }
  final dynamic areaId = json['area_id'];
  if (areaId != null) {
    cartBeanListAddress.areaId = areaId;
  }
  final dynamic address = json['address'];
  if (address != null) {
    cartBeanListAddress.address = address;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    cartBeanListAddress.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    cartBeanListAddress.lastName = lastName;
  }
  final String? houseNum = jsonConvert.convert<String>(json['house_num']);
  if (houseNum != null) {
    cartBeanListAddress.houseNum = houseNum;
  }
  final String? etc = jsonConvert.convert<String>(json['etc']);
  if (etc != null) {
    cartBeanListAddress.etc = etc;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    cartBeanListAddress.city = city;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    cartBeanListAddress.mobile = mobile;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    cartBeanListAddress.state = state;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    cartBeanListAddress.utime = utime;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    cartBeanListAddress.code = code;
  }
  final int? isDef = jsonConvert.convert<int>(json['is_def']);
  if (isDef != null) {
    cartBeanListAddress.isDef = isDef;
  }
  final String? zipCode = jsonConvert.convert<String>(json['zip_code']);
  if (zipCode != null) {
    cartBeanListAddress.zipCode = zipCode;
  }
  final int? cartId = jsonConvert.convert<int>(json['cart_id']);
  if (cartId != null) {
    cartBeanListAddress.cartId = cartId;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    cartBeanListAddress.country = country;
  }
  return cartBeanListAddress;
}

Map<String, dynamic> $CartBeanListAddressToJson(CartBeanListAddress entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['area_id'] = entity.areaId;
  data['address'] = entity.address;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['house_num'] = entity.houseNum;
  data['etc'] = entity.etc;
  data['city'] = entity.city;
  data['mobile'] = entity.mobile;
  data['state'] = entity.state;
  data['utime'] = entity.utime;
  data['code'] = entity.code;
  data['is_def'] = entity.isDef;
  data['zip_code'] = entity.zipCode;
  data['cart_id'] = entity.cartId;
  data['country'] = entity.country;
  return data;
}

extension CartBeanListAddressExtension on CartBeanListAddress {
  CartBeanListAddress copyWith({
    int? id,
    int? userId,
    dynamic areaId,
    dynamic address,
    String? firstName,
    String? lastName,
    String? houseNum,
    String? etc,
    String? city,
    String? mobile,
    String? state,
    int? utime,
    String? code,
    int? isDef,
    String? zipCode,
    int? cartId,
    String? country,
  }) {
    return CartBeanListAddress()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..areaId = areaId ?? this.areaId
      ..address = address ?? this.address
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..houseNum = houseNum ?? this.houseNum
      ..etc = etc ?? this.etc
      ..city = city ?? this.city
      ..mobile = mobile ?? this.mobile
      ..state = state ?? this.state
      ..utime = utime ?? this.utime
      ..code = code ?? this.code
      ..isDef = isDef ?? this.isDef
      ..zipCode = zipCode ?? this.zipCode
      ..cartId = cartId ?? this.cartId
      ..country = country ?? this.country;
  }
}

CartBeanListProducts $CartBeanListProductsFromJson(Map<String, dynamic> json) {
  final CartBeanListProducts cartBeanListProducts = CartBeanListProducts();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    cartBeanListProducts.id = id;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    cartBeanListProducts.goodsId = goodsId;
  }
  final dynamic barcode = json['barcode'];
  if (barcode != null) {
    cartBeanListProducts.barcode = barcode;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    cartBeanListProducts.sn = sn;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    cartBeanListProducts.price = price;
  }
  final String? costprice = jsonConvert.convert<String>(json['costprice']);
  if (costprice != null) {
    cartBeanListProducts.costprice = costprice;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    cartBeanListProducts.mktprice = mktprice;
  }
  final int? marketable = jsonConvert.convert<int>(json['marketable']);
  if (marketable != null) {
    cartBeanListProducts.marketable = marketable;
  }
  final int? stock = jsonConvert.convert<int>(json['stock']);
  if (stock != null) {
    cartBeanListProducts.stock = stock;
  }
  final int? freezeStock = jsonConvert.convert<int>(json['freeze_stock']);
  if (freezeStock != null) {
    cartBeanListProducts.freezeStock = freezeStock;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    cartBeanListProducts.spesDesc = spesDesc;
  }
  final int? isDefalut = jsonConvert.convert<int>(json['is_defalut']);
  if (isDefalut != null) {
    cartBeanListProducts.isDefalut = isDefalut;
  }
  final String? imageId = jsonConvert.convert<String>(json['image_id']);
  if (imageId != null) {
    cartBeanListProducts.imageId = imageId;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    cartBeanListProducts.isdel = isdel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    cartBeanListProducts.name = name;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    cartBeanListProducts.bn = bn;
  }
  final String? imagePath = jsonConvert.convert<String>(json['image_path']);
  if (imagePath != null) {
    cartBeanListProducts.imagePath = imagePath;
  }
  final int? totalStock = jsonConvert.convert<int>(json['total_stock']);
  if (totalStock != null) {
    cartBeanListProducts.totalStock = totalStock;
  }
  final int? isCombo = jsonConvert.convert<int>(json['is_combo']);
  if (isCombo != null) {
    cartBeanListProducts.isCombo = isCombo;
  }
  final List<dynamic>? gradePrice = (json['grade_price'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (gradePrice != null) {
    cartBeanListProducts.gradePrice = gradePrice;
  }
  final CartBeanListProductsGradeInfo? gradeInfo = jsonConvert.convert<
      CartBeanListProductsGradeInfo>(json['grade_info']);
  if (gradeInfo != null) {
    cartBeanListProducts.gradeInfo = gradeInfo;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    cartBeanListProducts.amount = amount;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    cartBeanListProducts.promotionList = promotionList;
  }
  final int? promotionAmount = jsonConvert.convert<int>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    cartBeanListProducts.promotionAmount = promotionAmount;
  }
  return cartBeanListProducts;
}

Map<String, dynamic> $CartBeanListProductsToJson(CartBeanListProducts entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['goods_id'] = entity.goodsId;
  data['barcode'] = entity.barcode;
  data['sn'] = entity.sn;
  data['price'] = entity.price;
  data['costprice'] = entity.costprice;
  data['mktprice'] = entity.mktprice;
  data['marketable'] = entity.marketable;
  data['stock'] = entity.stock;
  data['freeze_stock'] = entity.freezeStock;
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
  data['grade_info'] = entity.gradeInfo.toJson();
  data['amount'] = entity.amount;
  data['promotion_list'] = entity.promotionList;
  data['promotion_amount'] = entity.promotionAmount;
  return data;
}

extension CartBeanListProductsExtension on CartBeanListProducts {
  CartBeanListProducts copyWith({
    int? id,
    int? goodsId,
    dynamic barcode,
    String? sn,
    String? price,
    String? costprice,
    String? mktprice,
    int? marketable,
    int? stock,
    int? freezeStock,
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
    CartBeanListProductsGradeInfo? gradeInfo,
    String? amount,
    List<dynamic>? promotionList,
    int? promotionAmount,
  }) {
    return CartBeanListProducts()
      ..id = id ?? this.id
      ..goodsId = goodsId ?? this.goodsId
      ..barcode = barcode ?? this.barcode
      ..sn = sn ?? this.sn
      ..price = price ?? this.price
      ..costprice = costprice ?? this.costprice
      ..mktprice = mktprice ?? this.mktprice
      ..marketable = marketable ?? this.marketable
      ..stock = stock ?? this.stock
      ..freezeStock = freezeStock ?? this.freezeStock
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

CartBeanListProductsGradeInfo $CartBeanListProductsGradeInfoFromJson(
    Map<String, dynamic> json) {
  final CartBeanListProductsGradeInfo cartBeanListProductsGradeInfo = CartBeanListProductsGradeInfo();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    cartBeanListProductsGradeInfo.id = id;
  }
  return cartBeanListProductsGradeInfo;
}

Map<String, dynamic> $CartBeanListProductsGradeInfoToJson(
    CartBeanListProductsGradeInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  return data;
}

extension CartBeanListProductsGradeInfoExtension on CartBeanListProductsGradeInfo {
  CartBeanListProductsGradeInfo copyWith({
    int? id,
  }) {
    return CartBeanListProductsGradeInfo()
      ..id = id ?? this.id;
  }
}