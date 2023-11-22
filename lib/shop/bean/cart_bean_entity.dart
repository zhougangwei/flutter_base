import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/cart_bean_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/cart_bean_entity.g.dart';

@JsonSerializable()
class CartBeanEntity {
	@JSONField(name: "user_id")
	late int userId = 0;
	late int type = 0;
	late List<CartBeanList> list = [];
	@JSONField(name: "goods_amount")
	late double goodsAmount = 0;
	late String amount = '';
	@JSONField(name: "order_pmt")
	late double orderPmt = 0;
	@JSONField(name: "goods_pmt")
	late double goodsPmt = 0;
	@JSONField(name: "coupon_pmt")
	late double couponPmt = 0;
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	@JSONField(name: "cost_freight")
	late String costFreight = '';
	late int weight = 0;
	late List<dynamic> coupon = [];
	late int point = 0;
	@JSONField(name: "point_money")
	late int pointMoney = 0;

	late List<dynamic> params = [];


	CartBeanEntity();

	factory CartBeanEntity.fromJson(Map<String, dynamic> json) => $CartBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $CartBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartBeanList {
	late int id = 0;
	@JSONField(name: "user_id")
	late int userId = 0;
	@JSONField(name: "product_id")
	late int productId = 0;
	late int nums = 0;
	late int itemnums = 0;
	late String total = '0';
	late int type = 0;
	 CartBeanListAddress? address;
	late String weight = '';
	late CartBeanListProducts products;
	@JSONField(name: "is_select")
	late bool isSelect = false;
	late bool isCollection = false;
	late bool checked = false;

	CartBeanList();

	factory CartBeanList.fromJson(Map<String, dynamic> json) => $CartBeanListFromJson(json);

	Map<String, dynamic> toJson() => $CartBeanListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartBeanListAddress {
	late int id = 0;
	@JSONField(name: "user_id")
	late int userId = 0;
	@JSONField(name: "area_id")
	dynamic areaId;
	dynamic address;
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
	late int utime = 0;
	late String code = '';
	@JSONField(name: "is_def")
	late int isDef = 0;
	@JSONField(name: "zip_code")
	late String zipCode = '';
	@JSONField(name: "cart_id")
	late int cartId = 0;
	late String country = '';

	CartBeanListAddress();

	factory CartBeanListAddress.fromJson(Map<String, dynamic> json) => $CartBeanListAddressFromJson(json);

	Map<String, dynamic> toJson() => $CartBeanListAddressToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartBeanListProducts {
	late int id = 0;
	@JSONField(name: "goods_id")
	late int goodsId = 0;
	dynamic barcode;
	late String sn = '';
	late String price = '';
	late String costprice = '';
	late String mktprice = '';
	late int marketable = 0;
	late int stock = 0;
	@JSONField(name: "freeze_stock")
	late int freezeStock = 0;
	@JSONField(name: "spes_desc")
	late String spesDesc = '';
	@JSONField(name: "is_defalut")
	late int isDefalut = 0;
	@JSONField(name: "image_id")
	late String imageId = '';
	dynamic isdel;
	late String name = '';
	late String bn = '';
	@JSONField(name: "image_path")
	late String imagePath = '';
	@JSONField(name: "total_stock")
	late int totalStock = 0;
	@JSONField(name: "is_combo")
	late int isCombo = 0;
	@JSONField(name: "grade_price")
	late List<dynamic> gradePrice = [];
	@JSONField(name: "grade_info")
	late CartBeanListProductsGradeInfo gradeInfo;
	late String amount = '';
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	@JSONField(name: "promotion_amount")
	late int promotionAmount = 0;

	CartBeanListProducts();

	factory CartBeanListProducts.fromJson(Map<String, dynamic> json) => $CartBeanListProductsFromJson(json);

	Map<String, dynamic> toJson() => $CartBeanListProductsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartBeanListProductsGradeInfo {
	late int id = 0;

	CartBeanListProductsGradeInfo();

	factory CartBeanListProductsGradeInfo.fromJson(Map<String, dynamic> json) => $CartBeanListProductsGradeInfoFromJson(json);

	Map<String, dynamic> toJson() => $CartBeanListProductsGradeInfoToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}