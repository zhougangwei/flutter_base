import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/shop/bean/order_bean_entity.dart';

OrderBeanEntity $OrderBeanEntityFromJson(Map<String, dynamic> json) {
  final OrderBeanEntity orderBeanEntity = OrderBeanEntity();
  final List<OrderBeanList>? list = (json['list'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<OrderBeanList>(e) as OrderBeanList)
      .toList();
  if (list != null) {
    orderBeanEntity.list = list;
  }
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    orderBeanEntity.count = count;
  }
  final String? page = jsonConvert.convert<String>(json['page']);
  if (page != null) {
    orderBeanEntity.page = page;
  }
  final String? limit = jsonConvert.convert<String>(json['limit']);
  if (limit != null) {
    orderBeanEntity.limit = limit;
  }
  final dynamic status = json['status'];
  if (status != null) {
    orderBeanEntity.status = status;
  }
  return orderBeanEntity;
}

Map<String, dynamic> $OrderBeanEntityToJson(OrderBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['list'] = entity.list.map((v) => v.toJson()).toList();
  data['count'] = entity.count;
  data['page'] = entity.page;
  data['limit'] = entity.limit;
  data['status'] = entity.status;
  return data;
}

extension OrderBeanEntityExtension on OrderBeanEntity {
  OrderBeanEntity copyWith({
    List<OrderBeanList>? list,
    int? count,
    String? page,
    String? limit,
    dynamic status,
  }) {
    return OrderBeanEntity()
      ..list = list ?? this.list
      ..count = count ?? this.count
      ..page = page ?? this.page
      ..limit = limit ?? this.limit
      ..status = status ?? this.status;
  }
}

OrderBeanList $OrderBeanListFromJson(Map<String, dynamic> json) {
  final OrderBeanList orderBeanList = OrderBeanList();
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderBeanList.orderId = orderId;
  }
  final String? goodsAmount = jsonConvert.convert<String>(json['goods_amount']);
  if (goodsAmount != null) {
    orderBeanList.goodsAmount = goodsAmount;
  }
  final dynamic orderChildId = json['order_child_id'];
  if (orderChildId != null) {
    orderBeanList.orderChildId = orderChildId;
  }
  final String? payed = jsonConvert.convert<String>(json['payed']);
  if (payed != null) {
    orderBeanList.payed = payed;
  }
  final String? orderAmount = jsonConvert.convert<String>(json['order_amount']);
  if (orderAmount != null) {
    orderBeanList.orderAmount = orderAmount;
  }
  final int? payStatus = jsonConvert.convert<int>(json['pay_status']);
  if (payStatus != null) {
    orderBeanList.payStatus = payStatus;
  }
  final int? shipStatus = jsonConvert.convert<int>(json['ship_status']);
  if (shipStatus != null) {
    orderBeanList.shipStatus = shipStatus;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderBeanList.status = status;
  }
  final int? orderType = jsonConvert.convert<int>(json['order_type']);
  if (orderType != null) {
    orderBeanList.orderType = orderType;
  }
  final dynamic paymentCode = json['payment_code'];
  if (paymentCode != null) {
    orderBeanList.paymentCode = paymentCode;
  }
  final dynamic paymentTime = json['payment_time'];
  if (paymentTime != null) {
    orderBeanList.paymentTime = paymentTime;
  }
  final String? logisticsId = jsonConvert.convert<String>(json['logistics_id']);
  if (logisticsId != null) {
    orderBeanList.logisticsId = logisticsId;
  }
  final String? logisticsName = jsonConvert.convert<String>(
      json['logistics_name']);
  if (logisticsName != null) {
    orderBeanList.logisticsName = logisticsName;
  }
  final String? costFreight = jsonConvert.convert<String>(json['cost_freight']);
  if (costFreight != null) {
    orderBeanList.costFreight = costFreight;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    orderBeanList.userId = userId;
  }
  final dynamic sellerId = json['seller_id'];
  if (sellerId != null) {
    orderBeanList.sellerId = sellerId;
  }
  final int? confirm = jsonConvert.convert<int>(json['confirm']);
  if (confirm != null) {
    orderBeanList.confirm = confirm;
  }
  final dynamic confirmTime = json['confirm_time'];
  if (confirmTime != null) {
    orderBeanList.confirmTime = confirmTime;
  }
  final int? storeId = jsonConvert.convert<int>(json['store_id']);
  if (storeId != null) {
    orderBeanList.storeId = storeId;
  }
  final int? shipAreaId = jsonConvert.convert<int>(json['ship_area_id']);
  if (shipAreaId != null) {
    orderBeanList.shipAreaId = shipAreaId;
  }
  final dynamic shipAddress = json['ship_address'];
  if (shipAddress != null) {
    orderBeanList.shipAddress = shipAddress;
  }
  final dynamic shipName = json['ship_name'];
  if (shipName != null) {
    orderBeanList.shipName = shipName;
  }
  final dynamic shipMobile = json['ship_mobile'];
  if (shipMobile != null) {
    orderBeanList.shipMobile = shipMobile;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    orderBeanList.weight = weight;
  }
  final int? taxType = jsonConvert.convert<int>(json['tax_type']);
  if (taxType != null) {
    orderBeanList.taxType = taxType;
  }
  final String? taxCode = jsonConvert.convert<String>(json['tax_code']);
  if (taxCode != null) {
    orderBeanList.taxCode = taxCode;
  }
  final String? taxTitle = jsonConvert.convert<String>(json['tax_title']);
  if (taxTitle != null) {
    orderBeanList.taxTitle = taxTitle;
  }
  final int? point = jsonConvert.convert<int>(json['point']);
  if (point != null) {
    orderBeanList.point = point;
  }
  final String? pointMoney = jsonConvert.convert<String>(json['point_money']);
  if (pointMoney != null) {
    orderBeanList.pointMoney = pointMoney;
  }
  final String? orderPmt = jsonConvert.convert<String>(json['order_pmt']);
  if (orderPmt != null) {
    orderBeanList.orderPmt = orderPmt;
  }
  final String? goodsPmt = jsonConvert.convert<String>(json['goods_pmt']);
  if (goodsPmt != null) {
    orderBeanList.goodsPmt = goodsPmt;
  }
  final String? couponPmt = jsonConvert.convert<String>(json['coupon_pmt']);
  if (couponPmt != null) {
    orderBeanList.couponPmt = couponPmt;
  }
  final String? coupon = jsonConvert.convert<String>(json['coupon']);
  if (coupon != null) {
    orderBeanList.coupon = coupon;
  }
  final String? promotionList = jsonConvert.convert<String>(
      json['promotion_list']);
  if (promotionList != null) {
    orderBeanList.promotionList = promotionList;
  }
  final String? memo = jsonConvert.convert<String>(json['memo']);
  if (memo != null) {
    orderBeanList.memo = memo;
  }
  final String? ip = jsonConvert.convert<String>(json['ip']);
  if (ip != null) {
    orderBeanList.ip = ip;
  }
  final dynamic mark = json['mark'];
  if (mark != null) {
    orderBeanList.mark = mark;
  }
  final int? source = jsonConvert.convert<int>(json['source']);
  if (source != null) {
    orderBeanList.source = source;
  }
  final int? isComment = jsonConvert.convert<int>(json['is_comment']);
  if (isComment != null) {
    orderBeanList.isComment = isComment;
  }
  final int? ctime = jsonConvert.convert<int>(json['ctime']);
  if (ctime != null) {
    orderBeanList.ctime = ctime;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    orderBeanList.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    orderBeanList.isdel = isdel;
  }
  final String? spesDesc = jsonConvert.convert<String>(json['spes_desc']);
  if (spesDesc != null) {
    orderBeanList.spesDesc = spesDesc;
  }
  final List<OrderBeanListItems>? items = (json['items'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<OrderBeanListItems>(e) as OrderBeanListItems)
      .toList();
  if (items != null) {
    orderBeanList.items = items;
  }
  return orderBeanList;
}

Map<String, dynamic> $OrderBeanListToJson(OrderBeanList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['order_id'] = entity.orderId;
  data['goods_amount'] = entity.goodsAmount;
  data['order_child_id'] = entity.orderChildId;
  data['payed'] = entity.payed;
  data['order_amount'] = entity.orderAmount;
  data['pay_status'] = entity.payStatus;
  data['ship_status'] = entity.shipStatus;
  data['status'] = entity.status;
  data['order_type'] = entity.orderType;
  data['payment_code'] = entity.paymentCode;
  data['payment_time'] = entity.paymentTime;
  data['logistics_id'] = entity.logisticsId;
  data['logistics_name'] = entity.logisticsName;
  data['cost_freight'] = entity.costFreight;
  data['user_id'] = entity.userId;
  data['seller_id'] = entity.sellerId;
  data['confirm'] = entity.confirm;
  data['confirm_time'] = entity.confirmTime;
  data['store_id'] = entity.storeId;
  data['ship_area_id'] = entity.shipAreaId;
  data['ship_address'] = entity.shipAddress;
  data['ship_name'] = entity.shipName;
  data['ship_mobile'] = entity.shipMobile;
  data['weight'] = entity.weight;
  data['tax_type'] = entity.taxType;
  data['tax_code'] = entity.taxCode;
  data['tax_title'] = entity.taxTitle;
  data['point'] = entity.point;
  data['point_money'] = entity.pointMoney;
  data['order_pmt'] = entity.orderPmt;
  data['goods_pmt'] = entity.goodsPmt;
  data['coupon_pmt'] = entity.couponPmt;
  data['coupon'] = entity.coupon;
  data['promotion_list'] = entity.promotionList;
  data['memo'] = entity.memo;
  data['ip'] = entity.ip;
  data['mark'] = entity.mark;
  data['source'] = entity.source;
  data['is_comment'] = entity.isComment;
  data['ctime'] = entity.ctime;
  data['utime'] = entity.utime;
  data['isdel'] = entity.isdel;
  data['spes_desc'] = entity.spesDesc;
  data['items'] = entity.items.map((v) => v.toJson()).toList();
  return data;
}

extension OrderBeanListExtension on OrderBeanList {
  OrderBeanList copyWith({
    String? orderId,
    String? goodsAmount,
    dynamic orderChildId,
    String? payed,
    String? orderAmount,
    int? payStatus,
    int? shipStatus,
    int? status,
    int? orderType,
    dynamic paymentCode,
    dynamic paymentTime,
    String? logisticsId,
    String? logisticsName,
    String? costFreight,
    int? userId,
    dynamic sellerId,
    int? confirm,
    dynamic confirmTime,
    int? storeId,
    int? shipAreaId,
    dynamic shipAddress,
    dynamic shipName,
    dynamic shipMobile,
    int? weight,
    int? taxType,
    String? taxCode,
    String? taxTitle,
    int? point,
    String? pointMoney,
    String? orderPmt,
    String? goodsPmt,
    String? couponPmt,
    String? coupon,
    String? promotionList,
    String? memo,
    String? ip,
    dynamic mark,
    int? source,
    int? isComment,
    int? ctime,
    int? utime,
    dynamic isdel,
    String? spesDesc,
    List<OrderBeanListItems>? items,
  }) {
    return OrderBeanList()
      ..orderId = orderId ?? this.orderId
      ..goodsAmount = goodsAmount ?? this.goodsAmount
      ..orderChildId = orderChildId ?? this.orderChildId
      ..payed = payed ?? this.payed
      ..orderAmount = orderAmount ?? this.orderAmount
      ..payStatus = payStatus ?? this.payStatus
      ..shipStatus = shipStatus ?? this.shipStatus
      ..status = status ?? this.status
      ..orderType = orderType ?? this.orderType
      ..paymentCode = paymentCode ?? this.paymentCode
      ..paymentTime = paymentTime ?? this.paymentTime
      ..logisticsId = logisticsId ?? this.logisticsId
      ..logisticsName = logisticsName ?? this.logisticsName
      ..costFreight = costFreight ?? this.costFreight
      ..userId = userId ?? this.userId
      ..sellerId = sellerId ?? this.sellerId
      ..confirm = confirm ?? this.confirm
      ..confirmTime = confirmTime ?? this.confirmTime
      ..storeId = storeId ?? this.storeId
      ..shipAreaId = shipAreaId ?? this.shipAreaId
      ..shipAddress = shipAddress ?? this.shipAddress
      ..shipName = shipName ?? this.shipName
      ..shipMobile = shipMobile ?? this.shipMobile
      ..weight = weight ?? this.weight
      ..taxType = taxType ?? this.taxType
      ..taxCode = taxCode ?? this.taxCode
      ..taxTitle = taxTitle ?? this.taxTitle
      ..point = point ?? this.point
      ..pointMoney = pointMoney ?? this.pointMoney
      ..orderPmt = orderPmt ?? this.orderPmt
      ..goodsPmt = goodsPmt ?? this.goodsPmt
      ..couponPmt = couponPmt ?? this.couponPmt
      ..coupon = coupon ?? this.coupon
      ..promotionList = promotionList ?? this.promotionList
      ..memo = memo ?? this.memo
      ..ip = ip ?? this.ip
      ..mark = mark ?? this.mark
      ..source = source ?? this.source
      ..isComment = isComment ?? this.isComment
      ..ctime = ctime ?? this.ctime
      ..utime = utime ?? this.utime
      ..isdel = isdel ?? this.isdel
      ..spesDesc = spesDesc ?? this.spesDesc
      ..items = items ?? this.items;
  }
}

OrderBeanListItems $OrderBeanListItemsFromJson(Map<String, dynamic> json) {
  final OrderBeanListItems orderBeanListItems = OrderBeanListItems();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderBeanListItems.id = id;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderBeanListItems.orderId = orderId;
  }
  final String? orderChildId = jsonConvert.convert<String>(
      json['order_child_id']);
  if (orderChildId != null) {
    orderBeanListItems.orderChildId = orderChildId;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    orderBeanListItems.goodsId = goodsId;
  }
  final int? productId = jsonConvert.convert<int>(json['product_id']);
  if (productId != null) {
    orderBeanListItems.productId = productId;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    orderBeanListItems.sn = sn;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    orderBeanListItems.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderBeanListItems.name = name;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    orderBeanListItems.price = price;
  }
  final String? aveAmount = jsonConvert.convert<String>(json['ave_amount']);
  if (aveAmount != null) {
    orderBeanListItems.aveAmount = aveAmount;
  }
  final String? avePrice = jsonConvert.convert<String>(json['ave_price']);
  if (avePrice != null) {
    orderBeanListItems.avePrice = avePrice;
  }
  final String? costprice = jsonConvert.convert<String>(json['costprice']);
  if (costprice != null) {
    orderBeanListItems.costprice = costprice;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    orderBeanListItems.mktprice = mktprice;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    orderBeanListItems.imageUrl = imageUrl;
  }
  final int? nums = jsonConvert.convert<int>(json['nums']);
  if (nums != null) {
    orderBeanListItems.nums = nums;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    orderBeanListItems.amount = amount;
  }
  final String? promotionAmount = jsonConvert.convert<String>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    orderBeanListItems.promotionAmount = promotionAmount;
  }
  final String? promotionList = jsonConvert.convert<String>(
      json['promotion_list']);
  if (promotionList != null) {
    orderBeanListItems.promotionList = promotionList;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    orderBeanListItems.weight = weight;
  }
  final int? sendnums = jsonConvert.convert<int>(json['sendnums']);
  if (sendnums != null) {
    orderBeanListItems.sendnums = sendnums;
  }
  final int? isGift = jsonConvert.convert<int>(json['is_gift']);
  if (isGift != null) {
    orderBeanListItems.isGift = isGift;
  }
  final String? addon = jsonConvert.convert<String>(json['addon']);
  if (addon != null) {
    orderBeanListItems.addon = addon;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    orderBeanListItems.utime = utime;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    orderBeanListItems.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    orderBeanListItems.lastName = lastName;
  }
  final String? houseNum = jsonConvert.convert<String>(json['house_num']);
  if (houseNum != null) {
    orderBeanListItems.houseNum = houseNum;
  }
  final String? etc = jsonConvert.convert<String>(json['etc']);
  if (etc != null) {
    orderBeanListItems.etc = etc;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    orderBeanListItems.city = city;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    orderBeanListItems.mobile = mobile;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    orderBeanListItems.state = state;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    orderBeanListItems.code = code;
  }
  final String? zipCode = jsonConvert.convert<String>(json['zip_code']);
  if (zipCode != null) {
    orderBeanListItems.zipCode = zipCode;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    orderBeanListItems.country = country;
  }
  return orderBeanListItems;
}

Map<String, dynamic> $OrderBeanListItemsToJson(OrderBeanListItems entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['order_id'] = entity.orderId;
  data['order_child_id'] = entity.orderChildId;
  data['goods_id'] = entity.goodsId;
  data['product_id'] = entity.productId;
  data['sn'] = entity.sn;
  data['bn'] = entity.bn;
  data['name'] = entity.name;
  data['price'] = entity.price;
  data['ave_amount'] = entity.aveAmount;
  data['ave_price'] = entity.avePrice;
  data['costprice'] = entity.costprice;
  data['mktprice'] = entity.mktprice;
  data['image_url'] = entity.imageUrl;
  data['nums'] = entity.nums;
  data['amount'] = entity.amount;
  data['promotion_amount'] = entity.promotionAmount;
  data['promotion_list'] = entity.promotionList;
  data['weight'] = entity.weight;
  data['sendnums'] = entity.sendnums;
  data['is_gift'] = entity.isGift;
  data['addon'] = entity.addon;
  data['utime'] = entity.utime;
  data['first_name'] = entity.firstName;
  data['last_name'] = entity.lastName;
  data['house_num'] = entity.houseNum;
  data['etc'] = entity.etc;
  data['city'] = entity.city;
  data['mobile'] = entity.mobile;
  data['state'] = entity.state;
  data['code'] = entity.code;
  data['zip_code'] = entity.zipCode;
  data['country'] = entity.country;
  return data;
}

extension OrderBeanListItemsExtension on OrderBeanListItems {
  OrderBeanListItems copyWith({
    int? id,
    String? orderId,
    String? orderChildId,
    int? goodsId,
    int? productId,
    String? sn,
    String? bn,
    String? name,
    String? price,
    String? aveAmount,
    String? avePrice,
    String? costprice,
    String? mktprice,
    String? imageUrl,
    int? nums,
    String? amount,
    String? promotionAmount,
    String? promotionList,
    String? weight,
    int? sendnums,
    int? isGift,
    String? addon,
    int? utime,
    String? firstName,
    String? lastName,
    String? houseNum,
    String? etc,
    String? city,
    String? mobile,
    String? state,
    String? code,
    String? zipCode,
    String? country,
  }) {
    return OrderBeanListItems()
      ..id = id ?? this.id
      ..orderId = orderId ?? this.orderId
      ..orderChildId = orderChildId ?? this.orderChildId
      ..goodsId = goodsId ?? this.goodsId
      ..productId = productId ?? this.productId
      ..sn = sn ?? this.sn
      ..bn = bn ?? this.bn
      ..name = name ?? this.name
      ..price = price ?? this.price
      ..aveAmount = aveAmount ?? this.aveAmount
      ..avePrice = avePrice ?? this.avePrice
      ..costprice = costprice ?? this.costprice
      ..mktprice = mktprice ?? this.mktprice
      ..imageUrl = imageUrl ?? this.imageUrl
      ..nums = nums ?? this.nums
      ..amount = amount ?? this.amount
      ..promotionAmount = promotionAmount ?? this.promotionAmount
      ..promotionList = promotionList ?? this.promotionList
      ..weight = weight ?? this.weight
      ..sendnums = sendnums ?? this.sendnums
      ..isGift = isGift ?? this.isGift
      ..addon = addon ?? this.addon
      ..utime = utime ?? this.utime
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..houseNum = houseNum ?? this.houseNum
      ..etc = etc ?? this.etc
      ..city = city ?? this.city
      ..mobile = mobile ?? this.mobile
      ..state = state ?? this.state
      ..code = code ?? this.code
      ..zipCode = zipCode ?? this.zipCode
      ..country = country ?? this.country;
  }
}