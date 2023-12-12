import 'package:abce/generated/json/base/json_field.dart';
import 'package:abce/generated/json/orderinfobean_entity.g.dart';
import 'dart:convert';
export 'package:abce/generated/json/orderinfobean_entity.g.dart';

@JsonSerializable()
class OrderinfobeanEntity {
	@JSONField(name: "order_id")
	late String orderId = '';
	@JSONField(name: "goods_amount")
	late String goodsAmount = '';
	@JSONField(name: "order_child_id")
	dynamic orderChildId;
	late String payed = '';
	@JSONField(name: "order_amount")
	late String orderAmount = '';
	@JSONField(name: "pay_status")
	late int payStatus = 0;
	@JSONField(name: "ship_status")
	late int shipStatus = 0;
	late int status = 0;
	@JSONField(name: "order_type")
	late int orderType = 0;
	@JSONField(name: "payment_code")
	dynamic paymentCode;
	@JSONField(name: "payment_time")
	dynamic paymentTime;
	@JSONField(name: "logistics_id")
	late String logisticsId = '';
	@JSONField(name: "logistics_name")
	late String logisticsName = '';
	@JSONField(name: "cost_freight")
	late String costFreight = '';
	@JSONField(name: "user_id")
	late int userId = 0;
	@JSONField(name: "seller_id")
	dynamic sellerId;
	late int confirm = 0;
	@JSONField(name: "confirm_time")
	dynamic confirmTime;
	@JSONField(name: "store_id")
	late int storeId = 0;
	@JSONField(name: "ship_area_id")
	late int shipAreaId = 0;
	@JSONField(name: "ship_address")
	dynamic shipAddress;
	@JSONField(name: "ship_name")
	dynamic shipName;
	@JSONField(name: "ship_mobile")
	dynamic shipMobile;
	late int weight = 0;
	@JSONField(name: "tax_type")
	late int taxType = 0;
	@JSONField(name: "tax_code")
	late String taxCode = '';
	@JSONField(name: "tax_title")
	late String taxTitle = '';
	late int point = 0;
	@JSONField(name: "point_money")
	late String pointMoney = '';
	@JSONField(name: "order_pmt")
	late String orderPmt = '';
	@JSONField(name: "goods_pmt")
	late String goodsPmt = '';
	@JSONField(name: "coupon_pmt")
	late String couponPmt = '';
	late List<dynamic> coupon = [];
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	late String memo = '';
	late String ip = '';
	dynamic mark;
	late int source = 0;
	@JSONField(name: "is_comment")
	late int isComment = 0;
	late String ctime = '';
	late int utime = 0;
	dynamic isdel;
	late String username = '';
	late List<dynamic> delivery = [];
	late bool store = false;
	late OrderinfobeanLogistics logistics;
	@JSONField(name: "text_status")
	late String textStatus = '';
	@JSONField(name: "ship_area_name")
	late String shipAreaName = '';
	@JSONField(name: "payment_name")
	late String paymentName = '';
	late String remaining = '';
	@JSONField(name: "remaining_time")
	late int remainingTime = 0;
	@JSONField(name: "bill_aftersales_id")
	late bool billAftersalesId = false;
	late int refunded = 0;
	@JSONField(name: "add_aftersales_status")
	late bool addAftersalesStatus = false;
	late OrderinfobeanInvoice invoice;
	late List<OrderinfobeanItems> items = [];
	late OrderinfobeanUser user;
	late List<OrderinfobeanPaymentRelItem> paymentRelItem = [];
	late List<dynamic> refundItem = [];
	late List<dynamic> ladingItem = [];
	late List<dynamic> returnItem = [];
	late List<dynamic> aftersalesItem = [];

	OrderinfobeanEntity();

	factory OrderinfobeanEntity.fromJson(Map<String, dynamic> json) => $OrderinfobeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderinfobeanLogistics {
	late int id = 0;
	late String name = '';
	@JSONField(name: "has_cod")
	late int hasCod = 0;
	late int firstunit = 0;
	late int continueunit = 0;
	@JSONField(name: "def_area_fee")
	late int defAreaFee = 0;
	late int type = 0;
	@JSONField(name: "firstunit_price")
	late String firstunitPrice = '';
	@JSONField(name: "continueunit_price")
	late String continueunitPrice = '';
	late String exp = '';
	@JSONField(name: "logi_name")
	late String logiName = '';
	@JSONField(name: "logi_code")
	late String logiCode = '';
	@JSONField(name: "is_def")
	late int isDef = 0;
	late int sort = 0;
	late int status = 0;
	@JSONField(name: "free_postage")
	late int freePostage = 0;
	@JSONField(name: "area_fee")
	dynamic areaFee;
	late String goodsmoney = '';

	OrderinfobeanLogistics();

	factory OrderinfobeanLogistics.fromJson(Map<String, dynamic> json) => $OrderinfobeanLogisticsFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanLogisticsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderinfobeanInvoice {
	late int type = 0;
	late String title = '';
	@JSONField(name: "tax_number")
	late String taxNumber = '';

	OrderinfobeanInvoice();

	factory OrderinfobeanInvoice.fromJson(Map<String, dynamic> json) => $OrderinfobeanInvoiceFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanInvoiceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderinfobeanItems {
	late int id = 0;
	@JSONField(name: "order_id")
	late String orderId = '';
	@JSONField(name: "order_child_id")
	late String orderChildId = '';
	@JSONField(name: "goods_id")
	late int goodsId = 0;
	@JSONField(name: "product_id")
	late int productId = 0;
	late String sn = '';
	late String bn = '';
	late String name = '';
	late String price = '';
	@JSONField(name: "ave_amount")
	late double aveAmount;
	@JSONField(name: "ave_price")
	late double avePrice;
	late String costprice = '';
	late String mktprice = '';
	@JSONField(name: "image_url")
	late String imageUrl = '';
	late int nums = 0;
	late String amount = '';
	@JSONField(name: "promotion_amount")
	late String promotionAmount = '';
	@JSONField(name: "promotion_list")
	late String promotionList = '';
	late String weight = '';
	late int sendnums = 0;
	@JSONField(name: "is_gift")
	late int isGift = 0;
	late String addon = '';
	late int utime = 0;
	@JSONField(name: "first_name")
	late String firstName = '';
	@JSONField(name: "last_name")
	late String lastName = '';
	@JSONField(name: "house_num")
	late String houseNum = '';
	late String etc = '';
	late String city = '';
	late String mobile = '';
	late String state = '';
	late String code = '';
	@JSONField(name: "zip_code")
	late String zipCode = '';
	late String country = '';
	@JSONField(name: "reship_nums")
	late int reshipNums = 0;
	@JSONField(name: "reship_nums_ed")
	late int reshipNumsEd = 0;

	OrderinfobeanItems();

	factory OrderinfobeanItems.fromJson(Map<String, dynamic> json) => $OrderinfobeanItemsFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderinfobeanUser {
	late int id = 0;
	dynamic username;
	dynamic mobile;
	late String email = '';
	late int sex = 0;
	dynamic birthday;
	late String avatar = '';
	late String nickname = '';
	late String balance = '';
	late int point = 0;
	late int grade = 0;
	late int ctime = 0;
	dynamic utime;
	late int status = 0;
	late int pid = 0;
	late String remarks = '';
	@JSONField(name: "qr_code_id")
	dynamic qrCodeId;
	@JSONField(name: "old_qr_code")
	dynamic oldQrCode;

	OrderinfobeanUser();

	factory OrderinfobeanUser.fromJson(Map<String, dynamic> json) => $OrderinfobeanUserFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanUserToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderinfobeanPaymentRelItem {
	@JSONField(name: "payment_id")
	late String paymentId = '';
	@JSONField(name: "source_id")
	late String sourceId = '';
	late String money = '';
	late OrderinfobeanPaymentRelItemBill bill;

	OrderinfobeanPaymentRelItem();

	factory OrderinfobeanPaymentRelItem.fromJson(Map<String, dynamic> json) => $OrderinfobeanPaymentRelItemFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanPaymentRelItemToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderinfobeanPaymentRelItemBill {
	@JSONField(name: "payment_id")
	late String paymentId = '';
	late String money = '';
	@JSONField(name: "user_id")
	late int userId = 0;
	late int type = 0;
	late int status = 0;
	@JSONField(name: "payment_code")
	late String paymentCode = '';
	late String ip = '';
	late String params = '';
	@JSONField(name: "payed_msg")
	dynamic payedMsg;
	@JSONField(name: "trade_no")
	dynamic tradeNo;
	late int ctime = 0;
	late int utime = 0;
	late String trade = '';
	@JSONField(name: "payment_code_name")
	late String paymentCodeName = '';
	@JSONField(name: "status_name")
	late String statusName = '';
	@JSONField(name: "utime_name")
	late String utimeName = '';

	OrderinfobeanPaymentRelItemBill();

	factory OrderinfobeanPaymentRelItemBill.fromJson(Map<String, dynamic> json) => $OrderinfobeanPaymentRelItemBillFromJson(json);

	Map<String, dynamic> toJson() => $OrderinfobeanPaymentRelItemBillToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}