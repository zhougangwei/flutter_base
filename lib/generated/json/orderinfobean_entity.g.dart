import 'package:abce/generated/json/base/json_convert_content.dart';
import 'package:abce/shop/bean/orderinfobean_entity.dart';

OrderinfobeanEntity $OrderinfobeanEntityFromJson(Map<String, dynamic> json) {
  final OrderinfobeanEntity orderinfobeanEntity = OrderinfobeanEntity();
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderinfobeanEntity.orderId = orderId;
  }
  final String? goodsAmount = jsonConvert.convert<String>(json['goods_amount']);
  if (goodsAmount != null) {
    orderinfobeanEntity.goodsAmount = goodsAmount;
  }
  final dynamic orderChildId = json['order_child_id'];
  if (orderChildId != null) {
    orderinfobeanEntity.orderChildId = orderChildId;
  }
  final String? payed = jsonConvert.convert<String>(json['payed']);
  if (payed != null) {
    orderinfobeanEntity.payed = payed;
  }
  final String? orderAmount = jsonConvert.convert<String>(json['order_amount']);
  if (orderAmount != null) {
    orderinfobeanEntity.orderAmount = orderAmount;
  }
  final int? payStatus = jsonConvert.convert<int>(json['pay_status']);
  if (payStatus != null) {
    orderinfobeanEntity.payStatus = payStatus;
  }
  final int? shipStatus = jsonConvert.convert<int>(json['ship_status']);
  if (shipStatus != null) {
    orderinfobeanEntity.shipStatus = shipStatus;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderinfobeanEntity.status = status;
  }
  final int? orderType = jsonConvert.convert<int>(json['order_type']);
  if (orderType != null) {
    orderinfobeanEntity.orderType = orderType;
  }
  final dynamic paymentCode = json['payment_code'];
  if (paymentCode != null) {
    orderinfobeanEntity.paymentCode = paymentCode;
  }
  final dynamic paymentTime = json['payment_time'];
  if (paymentTime != null) {
    orderinfobeanEntity.paymentTime = paymentTime;
  }
  final String? logisticsId = jsonConvert.convert<String>(json['logistics_id']);
  if (logisticsId != null) {
    orderinfobeanEntity.logisticsId = logisticsId;
  }
  final String? logisticsName = jsonConvert.convert<String>(
      json['logistics_name']);
  if (logisticsName != null) {
    orderinfobeanEntity.logisticsName = logisticsName;
  }
  final String? costFreight = jsonConvert.convert<String>(json['cost_freight']);
  if (costFreight != null) {
    orderinfobeanEntity.costFreight = costFreight;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    orderinfobeanEntity.userId = userId;
  }
  final dynamic sellerId = json['seller_id'];
  if (sellerId != null) {
    orderinfobeanEntity.sellerId = sellerId;
  }
  final int? confirm = jsonConvert.convert<int>(json['confirm']);
  if (confirm != null) {
    orderinfobeanEntity.confirm = confirm;
  }
  final dynamic confirmTime = json['confirm_time'];
  if (confirmTime != null) {
    orderinfobeanEntity.confirmTime = confirmTime;
  }
  final int? storeId = jsonConvert.convert<int>(json['store_id']);
  if (storeId != null) {
    orderinfobeanEntity.storeId = storeId;
  }
  final int? shipAreaId = jsonConvert.convert<int>(json['ship_area_id']);
  if (shipAreaId != null) {
    orderinfobeanEntity.shipAreaId = shipAreaId;
  }
  final dynamic shipAddress = json['ship_address'];
  if (shipAddress != null) {
    orderinfobeanEntity.shipAddress = shipAddress;
  }
  final dynamic shipName = json['ship_name'];
  if (shipName != null) {
    orderinfobeanEntity.shipName = shipName;
  }
  final dynamic shipMobile = json['ship_mobile'];
  if (shipMobile != null) {
    orderinfobeanEntity.shipMobile = shipMobile;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    orderinfobeanEntity.weight = weight;
  }
  final int? taxType = jsonConvert.convert<int>(json['tax_type']);
  if (taxType != null) {
    orderinfobeanEntity.taxType = taxType;
  }
  final String? taxCode = jsonConvert.convert<String>(json['tax_code']);
  if (taxCode != null) {
    orderinfobeanEntity.taxCode = taxCode;
  }
  final String? taxTitle = jsonConvert.convert<String>(json['tax_title']);
  if (taxTitle != null) {
    orderinfobeanEntity.taxTitle = taxTitle;
  }
  final int? point = jsonConvert.convert<int>(json['point']);
  if (point != null) {
    orderinfobeanEntity.point = point;
  }
  final String? pointMoney = jsonConvert.convert<String>(json['point_money']);
  if (pointMoney != null) {
    orderinfobeanEntity.pointMoney = pointMoney;
  }
  final String? orderPmt = jsonConvert.convert<String>(json['order_pmt']);
  if (orderPmt != null) {
    orderinfobeanEntity.orderPmt = orderPmt;
  }
  final String? goodsPmt = jsonConvert.convert<String>(json['goods_pmt']);
  if (goodsPmt != null) {
    orderinfobeanEntity.goodsPmt = goodsPmt;
  }
  final String? couponPmt = jsonConvert.convert<String>(json['coupon_pmt']);
  if (couponPmt != null) {
    orderinfobeanEntity.couponPmt = couponPmt;
  }
  final List<dynamic>? coupon = (json['coupon'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (coupon != null) {
    orderinfobeanEntity.coupon = coupon;
  }
  final List<dynamic>? promotionList = (json['promotion_list'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (promotionList != null) {
    orderinfobeanEntity.promotionList = promotionList;
  }
  final String? memo = jsonConvert.convert<String>(json['memo']);
  if (memo != null) {
    orderinfobeanEntity.memo = memo;
  }
  final String? ip = jsonConvert.convert<String>(json['ip']);
  if (ip != null) {
    orderinfobeanEntity.ip = ip;
  }
  final dynamic mark = json['mark'];
  if (mark != null) {
    orderinfobeanEntity.mark = mark;
  }
  final int? source = jsonConvert.convert<int>(json['source']);
  if (source != null) {
    orderinfobeanEntity.source = source;
  }
  final int? isComment = jsonConvert.convert<int>(json['is_comment']);
  if (isComment != null) {
    orderinfobeanEntity.isComment = isComment;
  }
  final String? ctime = jsonConvert.convert<String>(json['ctime']);
  if (ctime != null) {
    orderinfobeanEntity.ctime = ctime;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    orderinfobeanEntity.utime = utime;
  }
  final dynamic isdel = json['isdel'];
  if (isdel != null) {
    orderinfobeanEntity.isdel = isdel;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    orderinfobeanEntity.username = username;
  }
  final List<dynamic>? delivery = (json['delivery'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (delivery != null) {
    orderinfobeanEntity.delivery = delivery;
  }
  final bool? store = jsonConvert.convert<bool>(json['store']);
  if (store != null) {
    orderinfobeanEntity.store = store;
  }
  final OrderinfobeanLogistics? logistics = jsonConvert.convert<
      OrderinfobeanLogistics>(json['logistics']);
  if (logistics != null) {
    orderinfobeanEntity.logistics = logistics;
  }
  final String? textStatus = jsonConvert.convert<String>(json['text_status']);
  if (textStatus != null) {
    orderinfobeanEntity.textStatus = textStatus;
  }
  final String? shipAreaName = jsonConvert.convert<String>(
      json['ship_area_name']);
  if (shipAreaName != null) {
    orderinfobeanEntity.shipAreaName = shipAreaName;
  }
  final String? paymentName = jsonConvert.convert<String>(json['payment_name']);
  if (paymentName != null) {
    orderinfobeanEntity.paymentName = paymentName;
  }
  final String? remaining = jsonConvert.convert<String>(json['remaining']);
  if (remaining != null) {
    orderinfobeanEntity.remaining = remaining;
  }
  final int? remainingTime = jsonConvert.convert<int>(json['remaining_time']);
  if (remainingTime != null) {
    orderinfobeanEntity.remainingTime = remainingTime;
  }
  final bool? billAftersalesId = jsonConvert.convert<bool>(
      json['bill_aftersales_id']);
  if (billAftersalesId != null) {
    orderinfobeanEntity.billAftersalesId = billAftersalesId;
  }
  final int? refunded = jsonConvert.convert<int>(json['refunded']);
  if (refunded != null) {
    orderinfobeanEntity.refunded = refunded;
  }
  final bool? addAftersalesStatus = jsonConvert.convert<bool>(
      json['add_aftersales_status']);
  if (addAftersalesStatus != null) {
    orderinfobeanEntity.addAftersalesStatus = addAftersalesStatus;
  }
  final OrderinfobeanInvoice? invoice = jsonConvert.convert<
      OrderinfobeanInvoice>(json['invoice']);
  if (invoice != null) {
    orderinfobeanEntity.invoice = invoice;
  }
  final List<OrderinfobeanItems>? items = (json['items'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<OrderinfobeanItems>(e) as OrderinfobeanItems)
      .toList();
  if (items != null) {
    orderinfobeanEntity.items = items;
  }
  final OrderinfobeanUser? user = jsonConvert.convert<OrderinfobeanUser>(
      json['user']);
  if (user != null) {
    orderinfobeanEntity.user = user;
  }
  final List<
      OrderinfobeanPaymentRelItem>? paymentRelItem = (json['paymentRelItem'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<OrderinfobeanPaymentRelItem>(
          e) as OrderinfobeanPaymentRelItem).toList();
  if (paymentRelItem != null) {
    orderinfobeanEntity.paymentRelItem = paymentRelItem;
  }
  final List<dynamic>? refundItem = (json['refundItem'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (refundItem != null) {
    orderinfobeanEntity.refundItem = refundItem;
  }
  final List<dynamic>? ladingItem = (json['ladingItem'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (ladingItem != null) {
    orderinfobeanEntity.ladingItem = ladingItem;
  }
  final List<dynamic>? returnItem = (json['returnItem'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (returnItem != null) {
    orderinfobeanEntity.returnItem = returnItem;
  }
  final List<dynamic>? aftersalesItem = (json['aftersalesItem'] as List<
      dynamic>?)?.map(
          (e) => e).toList();
  if (aftersalesItem != null) {
    orderinfobeanEntity.aftersalesItem = aftersalesItem;
  }
  return orderinfobeanEntity;
}

Map<String, dynamic> $OrderinfobeanEntityToJson(OrderinfobeanEntity entity) {
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
  data['username'] = entity.username;
  data['delivery'] = entity.delivery;
  data['store'] = entity.store;
  data['logistics'] = entity.logistics.toJson();
  data['text_status'] = entity.textStatus;
  data['ship_area_name'] = entity.shipAreaName;
  data['payment_name'] = entity.paymentName;
  data['remaining'] = entity.remaining;
  data['remaining_time'] = entity.remainingTime;
  data['bill_aftersales_id'] = entity.billAftersalesId;
  data['refunded'] = entity.refunded;
  data['add_aftersales_status'] = entity.addAftersalesStatus;
  data['invoice'] = entity.invoice.toJson();
  data['items'] = entity.items.map((v) => v.toJson()).toList();
  data['user'] = entity.user.toJson();
  data['paymentRelItem'] =
      entity.paymentRelItem.map((v) => v.toJson()).toList();
  data['refundItem'] = entity.refundItem;
  data['ladingItem'] = entity.ladingItem;
  data['returnItem'] = entity.returnItem;
  data['aftersalesItem'] = entity.aftersalesItem;
  return data;
}

extension OrderinfobeanEntityExtension on OrderinfobeanEntity {
  OrderinfobeanEntity copyWith({
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
    List<dynamic>? coupon,
    List<dynamic>? promotionList,
    String? memo,
    String? ip,
    dynamic mark,
    int? source,
    int? isComment,
    String? ctime,
    int? utime,
    dynamic isdel,
    String? username,
    List<dynamic>? delivery,
    bool? store,
    OrderinfobeanLogistics? logistics,
    String? textStatus,
    String? shipAreaName,
    String? paymentName,
    String? remaining,
    int? remainingTime,
    bool? billAftersalesId,
    int? refunded,
    bool? addAftersalesStatus,
    OrderinfobeanInvoice? invoice,
    List<OrderinfobeanItems>? items,
    OrderinfobeanUser? user,
    List<OrderinfobeanPaymentRelItem>? paymentRelItem,
    List<dynamic>? refundItem,
    List<dynamic>? ladingItem,
    List<dynamic>? returnItem,
    List<dynamic>? aftersalesItem,
  }) {
    return OrderinfobeanEntity()
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
      ..username = username ?? this.username
      ..delivery = delivery ?? this.delivery
      ..store = store ?? this.store
      ..logistics = logistics ?? this.logistics
      ..textStatus = textStatus ?? this.textStatus
      ..shipAreaName = shipAreaName ?? this.shipAreaName
      ..paymentName = paymentName ?? this.paymentName
      ..remaining = remaining ?? this.remaining
      ..remainingTime = remainingTime ?? this.remainingTime
      ..billAftersalesId = billAftersalesId ?? this.billAftersalesId
      ..refunded = refunded ?? this.refunded
      ..addAftersalesStatus = addAftersalesStatus ?? this.addAftersalesStatus
      ..invoice = invoice ?? this.invoice
      ..items = items ?? this.items
      ..user = user ?? this.user
      ..paymentRelItem = paymentRelItem ?? this.paymentRelItem
      ..refundItem = refundItem ?? this.refundItem
      ..ladingItem = ladingItem ?? this.ladingItem
      ..returnItem = returnItem ?? this.returnItem
      ..aftersalesItem = aftersalesItem ?? this.aftersalesItem;
  }
}

OrderinfobeanLogistics $OrderinfobeanLogisticsFromJson(
    Map<String, dynamic> json) {
  final OrderinfobeanLogistics orderinfobeanLogistics = OrderinfobeanLogistics();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderinfobeanLogistics.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderinfobeanLogistics.name = name;
  }
  final int? hasCod = jsonConvert.convert<int>(json['has_cod']);
  if (hasCod != null) {
    orderinfobeanLogistics.hasCod = hasCod;
  }
  final int? firstunit = jsonConvert.convert<int>(json['firstunit']);
  if (firstunit != null) {
    orderinfobeanLogistics.firstunit = firstunit;
  }
  final int? continueunit = jsonConvert.convert<int>(json['continueunit']);
  if (continueunit != null) {
    orderinfobeanLogistics.continueunit = continueunit;
  }
  final int? defAreaFee = jsonConvert.convert<int>(json['def_area_fee']);
  if (defAreaFee != null) {
    orderinfobeanLogistics.defAreaFee = defAreaFee;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    orderinfobeanLogistics.type = type;
  }
  final String? firstunitPrice = jsonConvert.convert<String>(
      json['firstunit_price']);
  if (firstunitPrice != null) {
    orderinfobeanLogistics.firstunitPrice = firstunitPrice;
  }
  final String? continueunitPrice = jsonConvert.convert<String>(
      json['continueunit_price']);
  if (continueunitPrice != null) {
    orderinfobeanLogistics.continueunitPrice = continueunitPrice;
  }
  final String? exp = jsonConvert.convert<String>(json['exp']);
  if (exp != null) {
    orderinfobeanLogistics.exp = exp;
  }
  final String? logiName = jsonConvert.convert<String>(json['logi_name']);
  if (logiName != null) {
    orderinfobeanLogistics.logiName = logiName;
  }
  final String? logiCode = jsonConvert.convert<String>(json['logi_code']);
  if (logiCode != null) {
    orderinfobeanLogistics.logiCode = logiCode;
  }
  final int? isDef = jsonConvert.convert<int>(json['is_def']);
  if (isDef != null) {
    orderinfobeanLogistics.isDef = isDef;
  }
  final int? sort = jsonConvert.convert<int>(json['sort']);
  if (sort != null) {
    orderinfobeanLogistics.sort = sort;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderinfobeanLogistics.status = status;
  }
  final int? freePostage = jsonConvert.convert<int>(json['free_postage']);
  if (freePostage != null) {
    orderinfobeanLogistics.freePostage = freePostage;
  }
  final dynamic areaFee = json['area_fee'];
  if (areaFee != null) {
    orderinfobeanLogistics.areaFee = areaFee;
  }
  final String? goodsmoney = jsonConvert.convert<String>(json['goodsmoney']);
  if (goodsmoney != null) {
    orderinfobeanLogistics.goodsmoney = goodsmoney;
  }
  return orderinfobeanLogistics;
}

Map<String, dynamic> $OrderinfobeanLogisticsToJson(
    OrderinfobeanLogistics entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['has_cod'] = entity.hasCod;
  data['firstunit'] = entity.firstunit;
  data['continueunit'] = entity.continueunit;
  data['def_area_fee'] = entity.defAreaFee;
  data['type'] = entity.type;
  data['firstunit_price'] = entity.firstunitPrice;
  data['continueunit_price'] = entity.continueunitPrice;
  data['exp'] = entity.exp;
  data['logi_name'] = entity.logiName;
  data['logi_code'] = entity.logiCode;
  data['is_def'] = entity.isDef;
  data['sort'] = entity.sort;
  data['status'] = entity.status;
  data['free_postage'] = entity.freePostage;
  data['area_fee'] = entity.areaFee;
  data['goodsmoney'] = entity.goodsmoney;
  return data;
}

extension OrderinfobeanLogisticsExtension on OrderinfobeanLogistics {
  OrderinfobeanLogistics copyWith({
    int? id,
    String? name,
    int? hasCod,
    int? firstunit,
    int? continueunit,
    int? defAreaFee,
    int? type,
    String? firstunitPrice,
    String? continueunitPrice,
    String? exp,
    String? logiName,
    String? logiCode,
    int? isDef,
    int? sort,
    int? status,
    int? freePostage,
    dynamic areaFee,
    String? goodsmoney,
  }) {
    return OrderinfobeanLogistics()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..hasCod = hasCod ?? this.hasCod
      ..firstunit = firstunit ?? this.firstunit
      ..continueunit = continueunit ?? this.continueunit
      ..defAreaFee = defAreaFee ?? this.defAreaFee
      ..type = type ?? this.type
      ..firstunitPrice = firstunitPrice ?? this.firstunitPrice
      ..continueunitPrice = continueunitPrice ?? this.continueunitPrice
      ..exp = exp ?? this.exp
      ..logiName = logiName ?? this.logiName
      ..logiCode = logiCode ?? this.logiCode
      ..isDef = isDef ?? this.isDef
      ..sort = sort ?? this.sort
      ..status = status ?? this.status
      ..freePostage = freePostage ?? this.freePostage
      ..areaFee = areaFee ?? this.areaFee
      ..goodsmoney = goodsmoney ?? this.goodsmoney;
  }
}

OrderinfobeanInvoice $OrderinfobeanInvoiceFromJson(Map<String, dynamic> json) {
  final OrderinfobeanInvoice orderinfobeanInvoice = OrderinfobeanInvoice();
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    orderinfobeanInvoice.type = type;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    orderinfobeanInvoice.title = title;
  }
  final String? taxNumber = jsonConvert.convert<String>(json['tax_number']);
  if (taxNumber != null) {
    orderinfobeanInvoice.taxNumber = taxNumber;
  }
  return orderinfobeanInvoice;
}

Map<String, dynamic> $OrderinfobeanInvoiceToJson(OrderinfobeanInvoice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['type'] = entity.type;
  data['title'] = entity.title;
  data['tax_number'] = entity.taxNumber;
  return data;
}

extension OrderinfobeanInvoiceExtension on OrderinfobeanInvoice {
  OrderinfobeanInvoice copyWith({
    int? type,
    String? title,
    String? taxNumber,
  }) {
    return OrderinfobeanInvoice()
      ..type = type ?? this.type
      ..title = title ?? this.title
      ..taxNumber = taxNumber ?? this.taxNumber;
  }
}

OrderinfobeanItems $OrderinfobeanItemsFromJson(Map<String, dynamic> json) {
  final OrderinfobeanItems orderinfobeanItems = OrderinfobeanItems();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderinfobeanItems.id = id;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    orderinfobeanItems.orderId = orderId;
  }
  final String? orderChildId = jsonConvert.convert<String>(
      json['order_child_id']);
  if (orderChildId != null) {
    orderinfobeanItems.orderChildId = orderChildId;
  }
  final int? goodsId = jsonConvert.convert<int>(json['goods_id']);
  if (goodsId != null) {
    orderinfobeanItems.goodsId = goodsId;
  }
  final int? productId = jsonConvert.convert<int>(json['product_id']);
  if (productId != null) {
    orderinfobeanItems.productId = productId;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    orderinfobeanItems.sn = sn;
  }
  final String? bn = jsonConvert.convert<String>(json['bn']);
  if (bn != null) {
    orderinfobeanItems.bn = bn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    orderinfobeanItems.name = name;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    orderinfobeanItems.price = price;
  }
  final double? aveAmount = jsonConvert.convert<double>(json['ave_amount']);
  if (aveAmount != null) {
    orderinfobeanItems.aveAmount = aveAmount;
  }
  final double? avePrice = jsonConvert.convert<double>(json['ave_price']);
  if (avePrice != null) {
    orderinfobeanItems.avePrice = avePrice;
  }
  final String? costprice = jsonConvert.convert<String>(json['costprice']);
  if (costprice != null) {
    orderinfobeanItems.costprice = costprice;
  }
  final String? mktprice = jsonConvert.convert<String>(json['mktprice']);
  if (mktprice != null) {
    orderinfobeanItems.mktprice = mktprice;
  }
  final String? imageUrl = jsonConvert.convert<String>(json['image_url']);
  if (imageUrl != null) {
    orderinfobeanItems.imageUrl = imageUrl;
  }
  final int? nums = jsonConvert.convert<int>(json['nums']);
  if (nums != null) {
    orderinfobeanItems.nums = nums;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    orderinfobeanItems.amount = amount;
  }
  final String? promotionAmount = jsonConvert.convert<String>(
      json['promotion_amount']);
  if (promotionAmount != null) {
    orderinfobeanItems.promotionAmount = promotionAmount;
  }
  final String? promotionList = jsonConvert.convert<String>(
      json['promotion_list']);
  if (promotionList != null) {
    orderinfobeanItems.promotionList = promotionList;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    orderinfobeanItems.weight = weight;
  }
  final int? sendnums = jsonConvert.convert<int>(json['sendnums']);
  if (sendnums != null) {
    orderinfobeanItems.sendnums = sendnums;
  }
  final int? isGift = jsonConvert.convert<int>(json['is_gift']);
  if (isGift != null) {
    orderinfobeanItems.isGift = isGift;
  }
  final String? addon = jsonConvert.convert<String>(json['addon']);
  if (addon != null) {
    orderinfobeanItems.addon = addon;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    orderinfobeanItems.utime = utime;
  }
  final String? firstName = jsonConvert.convert<String>(json['first_name']);
  if (firstName != null) {
    orderinfobeanItems.firstName = firstName;
  }
  final String? lastName = jsonConvert.convert<String>(json['last_name']);
  if (lastName != null) {
    orderinfobeanItems.lastName = lastName;
  }
  final String? houseNum = jsonConvert.convert<String>(json['house_num']);
  if (houseNum != null) {
    orderinfobeanItems.houseNum = houseNum;
  }
  final String? etc = jsonConvert.convert<String>(json['etc']);
  if (etc != null) {
    orderinfobeanItems.etc = etc;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    orderinfobeanItems.city = city;
  }
  final String? mobile = jsonConvert.convert<String>(json['mobile']);
  if (mobile != null) {
    orderinfobeanItems.mobile = mobile;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    orderinfobeanItems.state = state;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    orderinfobeanItems.code = code;
  }
  final String? zipCode = jsonConvert.convert<String>(json['zip_code']);
  if (zipCode != null) {
    orderinfobeanItems.zipCode = zipCode;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    orderinfobeanItems.country = country;
  }
  final int? reshipNums = jsonConvert.convert<int>(json['reship_nums']);
  if (reshipNums != null) {
    orderinfobeanItems.reshipNums = reshipNums;
  }
  final int? reshipNumsEd = jsonConvert.convert<int>(json['reship_nums_ed']);
  if (reshipNumsEd != null) {
    orderinfobeanItems.reshipNumsEd = reshipNumsEd;
  }
  return orderinfobeanItems;
}

Map<String, dynamic> $OrderinfobeanItemsToJson(OrderinfobeanItems entity) {
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
  data['reship_nums'] = entity.reshipNums;
  data['reship_nums_ed'] = entity.reshipNumsEd;
  return data;
}

extension OrderinfobeanItemsExtension on OrderinfobeanItems {
  OrderinfobeanItems copyWith({
    int? id,
    String? orderId,
    String? orderChildId,
    int? goodsId,
    int? productId,
    String? sn,
    String? bn,
    String? name,
    String? price,
    double? aveAmount,
    double? avePrice,
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
    int? reshipNums,
    int? reshipNumsEd,
  }) {
    return OrderinfobeanItems()
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
      ..country = country ?? this.country
      ..reshipNums = reshipNums ?? this.reshipNums
      ..reshipNumsEd = reshipNumsEd ?? this.reshipNumsEd;
  }
}

OrderinfobeanUser $OrderinfobeanUserFromJson(Map<String, dynamic> json) {
  final OrderinfobeanUser orderinfobeanUser = OrderinfobeanUser();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    orderinfobeanUser.id = id;
  }
  final dynamic username = json['username'];
  if (username != null) {
    orderinfobeanUser.username = username;
  }
  final dynamic mobile = json['mobile'];
  if (mobile != null) {
    orderinfobeanUser.mobile = mobile;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    orderinfobeanUser.email = email;
  }
  final int? sex = jsonConvert.convert<int>(json['sex']);
  if (sex != null) {
    orderinfobeanUser.sex = sex;
  }
  final dynamic birthday = json['birthday'];
  if (birthday != null) {
    orderinfobeanUser.birthday = birthday;
  }
  final String? avatar = jsonConvert.convert<String>(json['avatar']);
  if (avatar != null) {
    orderinfobeanUser.avatar = avatar;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    orderinfobeanUser.nickname = nickname;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    orderinfobeanUser.balance = balance;
  }
  final int? point = jsonConvert.convert<int>(json['point']);
  if (point != null) {
    orderinfobeanUser.point = point;
  }
  final int? grade = jsonConvert.convert<int>(json['grade']);
  if (grade != null) {
    orderinfobeanUser.grade = grade;
  }
  final int? ctime = jsonConvert.convert<int>(json['ctime']);
  if (ctime != null) {
    orderinfobeanUser.ctime = ctime;
  }
  final dynamic utime = json['utime'];
  if (utime != null) {
    orderinfobeanUser.utime = utime;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderinfobeanUser.status = status;
  }
  final int? pid = jsonConvert.convert<int>(json['pid']);
  if (pid != null) {
    orderinfobeanUser.pid = pid;
  }
  final String? remarks = jsonConvert.convert<String>(json['remarks']);
  if (remarks != null) {
    orderinfobeanUser.remarks = remarks;
  }
  final dynamic qrCodeId = json['qr_code_id'];
  if (qrCodeId != null) {
    orderinfobeanUser.qrCodeId = qrCodeId;
  }
  final dynamic oldQrCode = json['old_qr_code'];
  if (oldQrCode != null) {
    orderinfobeanUser.oldQrCode = oldQrCode;
  }
  return orderinfobeanUser;
}

Map<String, dynamic> $OrderinfobeanUserToJson(OrderinfobeanUser entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['username'] = entity.username;
  data['mobile'] = entity.mobile;
  data['email'] = entity.email;
  data['sex'] = entity.sex;
  data['birthday'] = entity.birthday;
  data['avatar'] = entity.avatar;
  data['nickname'] = entity.nickname;
  data['balance'] = entity.balance;
  data['point'] = entity.point;
  data['grade'] = entity.grade;
  data['ctime'] = entity.ctime;
  data['utime'] = entity.utime;
  data['status'] = entity.status;
  data['pid'] = entity.pid;
  data['remarks'] = entity.remarks;
  data['qr_code_id'] = entity.qrCodeId;
  data['old_qr_code'] = entity.oldQrCode;
  return data;
}

extension OrderinfobeanUserExtension on OrderinfobeanUser {
  OrderinfobeanUser copyWith({
    int? id,
    dynamic username,
    dynamic mobile,
    String? email,
    int? sex,
    dynamic birthday,
    String? avatar,
    String? nickname,
    String? balance,
    int? point,
    int? grade,
    int? ctime,
    dynamic utime,
    int? status,
    int? pid,
    String? remarks,
    dynamic qrCodeId,
    dynamic oldQrCode,
  }) {
    return OrderinfobeanUser()
      ..id = id ?? this.id
      ..username = username ?? this.username
      ..mobile = mobile ?? this.mobile
      ..email = email ?? this.email
      ..sex = sex ?? this.sex
      ..birthday = birthday ?? this.birthday
      ..avatar = avatar ?? this.avatar
      ..nickname = nickname ?? this.nickname
      ..balance = balance ?? this.balance
      ..point = point ?? this.point
      ..grade = grade ?? this.grade
      ..ctime = ctime ?? this.ctime
      ..utime = utime ?? this.utime
      ..status = status ?? this.status
      ..pid = pid ?? this.pid
      ..remarks = remarks ?? this.remarks
      ..qrCodeId = qrCodeId ?? this.qrCodeId
      ..oldQrCode = oldQrCode ?? this.oldQrCode;
  }
}

OrderinfobeanPaymentRelItem $OrderinfobeanPaymentRelItemFromJson(
    Map<String, dynamic> json) {
  final OrderinfobeanPaymentRelItem orderinfobeanPaymentRelItem = OrderinfobeanPaymentRelItem();
  final String? paymentId = jsonConvert.convert<String>(json['payment_id']);
  if (paymentId != null) {
    orderinfobeanPaymentRelItem.paymentId = paymentId;
  }
  final String? sourceId = jsonConvert.convert<String>(json['source_id']);
  if (sourceId != null) {
    orderinfobeanPaymentRelItem.sourceId = sourceId;
  }
  final String? money = jsonConvert.convert<String>(json['money']);
  if (money != null) {
    orderinfobeanPaymentRelItem.money = money;
  }
  final OrderinfobeanPaymentRelItemBill? bill = jsonConvert.convert<
      OrderinfobeanPaymentRelItemBill>(json['bill']);
  if (bill != null) {
    orderinfobeanPaymentRelItem.bill = bill;
  }
  return orderinfobeanPaymentRelItem;
}

Map<String, dynamic> $OrderinfobeanPaymentRelItemToJson(
    OrderinfobeanPaymentRelItem entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['payment_id'] = entity.paymentId;
  data['source_id'] = entity.sourceId;
  data['money'] = entity.money;
  data['bill'] = entity.bill.toJson();
  return data;
}

extension OrderinfobeanPaymentRelItemExtension on OrderinfobeanPaymentRelItem {
  OrderinfobeanPaymentRelItem copyWith({
    String? paymentId,
    String? sourceId,
    String? money,
    OrderinfobeanPaymentRelItemBill? bill,
  }) {
    return OrderinfobeanPaymentRelItem()
      ..paymentId = paymentId ?? this.paymentId
      ..sourceId = sourceId ?? this.sourceId
      ..money = money ?? this.money
      ..bill = bill ?? this.bill;
  }
}

OrderinfobeanPaymentRelItemBill $OrderinfobeanPaymentRelItemBillFromJson(
    Map<String, dynamic> json) {
  final OrderinfobeanPaymentRelItemBill orderinfobeanPaymentRelItemBill = OrderinfobeanPaymentRelItemBill();
  final String? paymentId = jsonConvert.convert<String>(json['payment_id']);
  if (paymentId != null) {
    orderinfobeanPaymentRelItemBill.paymentId = paymentId;
  }
  final String? money = jsonConvert.convert<String>(json['money']);
  if (money != null) {
    orderinfobeanPaymentRelItemBill.money = money;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    orderinfobeanPaymentRelItemBill.userId = userId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    orderinfobeanPaymentRelItemBill.type = type;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    orderinfobeanPaymentRelItemBill.status = status;
  }
  final String? paymentCode = jsonConvert.convert<String>(json['payment_code']);
  if (paymentCode != null) {
    orderinfobeanPaymentRelItemBill.paymentCode = paymentCode;
  }
  final String? ip = jsonConvert.convert<String>(json['ip']);
  if (ip != null) {
    orderinfobeanPaymentRelItemBill.ip = ip;
  }
  final String? params = jsonConvert.convert<String>(json['params']);
  if (params != null) {
    orderinfobeanPaymentRelItemBill.params = params;
  }
  final dynamic payedMsg = json['payed_msg'];
  if (payedMsg != null) {
    orderinfobeanPaymentRelItemBill.payedMsg = payedMsg;
  }
  final dynamic tradeNo = json['trade_no'];
  if (tradeNo != null) {
    orderinfobeanPaymentRelItemBill.tradeNo = tradeNo;
  }
  final int? ctime = jsonConvert.convert<int>(json['ctime']);
  if (ctime != null) {
    orderinfobeanPaymentRelItemBill.ctime = ctime;
  }
  final int? utime = jsonConvert.convert<int>(json['utime']);
  if (utime != null) {
    orderinfobeanPaymentRelItemBill.utime = utime;
  }
  final String? trade = jsonConvert.convert<String>(json['trade']);
  if (trade != null) {
    orderinfobeanPaymentRelItemBill.trade = trade;
  }
  final String? paymentCodeName = jsonConvert.convert<String>(
      json['payment_code_name']);
  if (paymentCodeName != null) {
    orderinfobeanPaymentRelItemBill.paymentCodeName = paymentCodeName;
  }
  final String? statusName = jsonConvert.convert<String>(json['status_name']);
  if (statusName != null) {
    orderinfobeanPaymentRelItemBill.statusName = statusName;
  }
  final String? utimeName = jsonConvert.convert<String>(json['utime_name']);
  if (utimeName != null) {
    orderinfobeanPaymentRelItemBill.utimeName = utimeName;
  }
  return orderinfobeanPaymentRelItemBill;
}

Map<String, dynamic> $OrderinfobeanPaymentRelItemBillToJson(
    OrderinfobeanPaymentRelItemBill entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['payment_id'] = entity.paymentId;
  data['money'] = entity.money;
  data['user_id'] = entity.userId;
  data['type'] = entity.type;
  data['status'] = entity.status;
  data['payment_code'] = entity.paymentCode;
  data['ip'] = entity.ip;
  data['params'] = entity.params;
  data['payed_msg'] = entity.payedMsg;
  data['trade_no'] = entity.tradeNo;
  data['ctime'] = entity.ctime;
  data['utime'] = entity.utime;
  data['trade'] = entity.trade;
  data['payment_code_name'] = entity.paymentCodeName;
  data['status_name'] = entity.statusName;
  data['utime_name'] = entity.utimeName;
  return data;
}

extension OrderinfobeanPaymentRelItemBillExtension on OrderinfobeanPaymentRelItemBill {
  OrderinfobeanPaymentRelItemBill copyWith({
    String? paymentId,
    String? money,
    int? userId,
    int? type,
    int? status,
    String? paymentCode,
    String? ip,
    String? params,
    dynamic payedMsg,
    dynamic tradeNo,
    int? ctime,
    int? utime,
    String? trade,
    String? paymentCodeName,
    String? statusName,
    String? utimeName,
  }) {
    return OrderinfobeanPaymentRelItemBill()
      ..paymentId = paymentId ?? this.paymentId
      ..money = money ?? this.money
      ..userId = userId ?? this.userId
      ..type = type ?? this.type
      ..status = status ?? this.status
      ..paymentCode = paymentCode ?? this.paymentCode
      ..ip = ip ?? this.ip
      ..params = params ?? this.params
      ..payedMsg = payedMsg ?? this.payedMsg
      ..tradeNo = tradeNo ?? this.tradeNo
      ..ctime = ctime ?? this.ctime
      ..utime = utime ?? this.utime
      ..trade = trade ?? this.trade
      ..paymentCodeName = paymentCodeName ?? this.paymentCodeName
      ..statusName = statusName ?? this.statusName
      ..utimeName = utimeName ?? this.utimeName;
  }
}