import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/page_bean_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/page_bean_entity.g.dart';

@JsonSerializable()
class PageBeanEntity {
	late String name = '';
	late List<PageBeanChild> child = [];

	PageBeanEntity();

	factory PageBeanEntity.fromJson(Map<String, dynamic> json) => $PageBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $PageBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PageBeanChild {
	late int id;
	late String bn = '';
	late String name = '';
	late String brief = '';
	late String price = '';
	late String mktprice = '';
	@JSONField(name: "image_id")
	late String imageId = '';
	@JSONField(name: "goods_cat_id")
	late double goodsCatId;
	@JSONField(name: "goods_type_id")
	late double goodsTypeId;
	@JSONField(name: "brand_id")
	late double brandId;
	@JSONField(name: "is_nomal_virtual")
	late double isNomalVirtual;
	late double marketable;
	late double stock;
	late String weight = '';
	late String unit = '';
	late String intro = '';
	@JSONField(name: "spes_desc")
	late String spesDesc = '';
	late String params = '';
	@JSONField(name: "comments_count")
	late double commentsCount;
	@JSONField(name: "view_count")
	late double viewCount;
	@JSONField(name: "buy_count")
	late double buyCount;
	dynamic uptime;
	dynamic downtime;
	late double sort;
	@JSONField(name: "is_recommend")
	late double isRecommend;
	@JSONField(name: "is_hot")
	late double isHot;
	@JSONField(name: "label_ids")
	late List<dynamic> labelIds = [];
	@JSONField(name: "new_spec")
	late String newSpec = '';
	dynamic ctime;
	late double utime;
	dynamic isdel;
	@JSONField(name: "is_combo")
	late double isCombo;
	@JSONField(name: "category_id")
	late double categoryId;
	@JSONField(name: "score_sum")
	late String scoreSum = '';
	@JSONField(name: "cat_name")
	late String catName = '';
	late String home = '';
	@JSONField(name: "image_url")
	late String imageUrl = '';
	@JSONField(name: "Tags")
	late String tags = '';
	late double bai;
	late PageBeanChildProduct product;
	late List<String> album = [];
	late bool isfav = false;
	late List<PageBeanChildCanshu> canshu = [];
	dynamic category;

	PageBeanChild();

	factory PageBeanChild.fromJson(Map<String, dynamic> json) => $PageBeanChildFromJson(json);

	Map<String, dynamic> toJson() => $PageBeanChildToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PageBeanChildProduct {
	late int id;
	@JSONField(name: "goods_id")
	late double goodsId;
	dynamic barcode;
	late String sn = '';
	late String price = '';
	late String mktprice = '';
	late double marketable;
	late double stock;
	@JSONField(name: "spes_desc")
	dynamic spesDesc;
	@JSONField(name: "is_defalut")
	late double isDefalut;
	@JSONField(name: "image_id")
	late String imageId = '';
	dynamic isdel;
	late String name = '';
	late String bn = '';
	@JSONField(name: "image_path")
	late String imagePath = '';
	@JSONField(name: "total_stock")
	late double totalStock;
	@JSONField(name: "is_combo")
	late double isCombo;
	@JSONField(name: "grade_price")
	late List<dynamic> gradePrice = [];
	@JSONField(name: "grade_info")
	late List<dynamic> gradeInfo = [];
	late String amount = '';
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	@JSONField(name: "promotion_amount")
	late double promotionAmount;

	PageBeanChildProduct();

	factory PageBeanChildProduct.fromJson(Map<String, dynamic> json) => $PageBeanChildProductFromJson(json);

	Map<String, dynamic> toJson() => $PageBeanChildProductToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PageBeanChildCanshu {
	late int id;
	@JSONField(name: "goods_id")
	late double goodsId;
	late String value = '';
	dynamic sort;

	PageBeanChildCanshu();

	factory PageBeanChildCanshu.fromJson(Map<String, dynamic> json) => $PageBeanChildCanshuFromJson(json);

	Map<String, dynamic> toJson() => $PageBeanChildCanshuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}