import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/order_bean_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/order_bean_entity.g.dart';

@JsonSerializable()
class OrderBeanEntity {
	late List<OrderBeanList> list = [];
	late int count = 0;
	late String page = '';
	late String limit = '';
	dynamic status;

	OrderBeanEntity();

	factory OrderBeanEntity.fromJson(Map<String, dynamic> json) => $OrderBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $OrderBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderBeanList {
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
	late String coupon = '';
	@JSONField(name: "promotion_list")
	late String promotionList = '';
	late String memo = '';
	late String ip = '';
	dynamic mark;
	late int source = 0;
	@JSONField(name: "is_comment")
	late int isComment = 0;
	late int ctime = 0;
	late int utime = 0;
	dynamic isdel;
	@JSONField(name: "spes_desc")
	late String spesDesc = '';
	late List<OrderBeanListItems> items = [];

	OrderBeanList();

	factory OrderBeanList.fromJson(Map<String, dynamic> json) => $OrderBeanListFromJson(json);

	Map<String, dynamic> toJson() => $OrderBeanListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class OrderBeanListItems {
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
	late String aveAmount = '';
	@JSONField(name: "ave_price")
	late String avePrice = '';
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

	OrderBeanListItems();

	factory OrderBeanListItems.fromJson(Map<String, dynamic> json) => $OrderBeanListItemsFromJson(json);

	Map<String, dynamic> toJson() => $OrderBeanListItemsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}