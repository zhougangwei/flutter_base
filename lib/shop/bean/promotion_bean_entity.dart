import 'package:abce/generated/json/base/json_field.dart';
import 'package:abce/generated/json/promotion_bean_entity.g.dart';
import 'dart:convert';
export 'package:abce/generated/json/promotion_bean_entity.g.dart';

@JsonSerializable()
class PromotionBeanEntity {
	late List<PromotionBeanList> list = [];
	@JSONField(name: "total_page")
	late int totalPage = 0;

	PromotionBeanEntity();

	factory PromotionBeanEntity.fromJson(Map<String, dynamic> json) => $PromotionBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $PromotionBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PromotionBeanList {
	late int id = 0;
	@JSONField(name: "image_id")
	late String imageId = '';
	late String code = '';
	late String params = '';
	late String image = '';
	late List<PromotionBeanListChild> child = [];

	PromotionBeanList();

	factory PromotionBeanList.fromJson(Map<String, dynamic> json) => $PromotionBeanListFromJson(json);

	Map<String, dynamic> toJson() => $PromotionBeanListToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PromotionBeanListChild {
	late int id = 0;
	late String bn = '';
	late String name = '';
	late String brief = '';
	late String price = '';
	late String mktprice = '';
	@JSONField(name: "image_id")
	late String imageId = '';
	@JSONField(name: "goods_cat_id")
	late int goodsCatId = 0;
	@JSONField(name: "goods_type_id")
	late int goodsTypeId = 0;
	@JSONField(name: "brand_id")
	late int brandId = 0;
	@JSONField(name: "is_nomal_virtual")
	late int isNomalVirtual = 0;
	late int marketable = 0;
	late int stock = 0;
	late String weight = '';
	late String unit = '';
	late String intro = '';
	@JSONField(name: "spes_desc")
	late String spesDesc = '';
	late String params = '';
	@JSONField(name: "comments_count")
	late int commentsCount = 0;
	@JSONField(name: "view_count")
	late int viewCount = 0;
	@JSONField(name: "buy_count")
	late int buyCount = 0;
	dynamic uptime;
	dynamic downtime;
	late int sort = 0;
	@JSONField(name: "is_recommend")
	late int isRecommend = 0;
	@JSONField(name: "is_hot")
	late int isHot = 0;
	@JSONField(name: "label_ids")
	late List<dynamic> labelIds = [];
	@JSONField(name: "new_spec")
	late String newSpec = '';
	dynamic ctime;
	late int utime = 0;
	dynamic isdel;
	@JSONField(name: "is_combo")
	late int isCombo = 0;
	@JSONField(name: "category_id")
	late int categoryId = 0;
	@JSONField(name: "score_sum")
	late String scoreSum = '';
	@JSONField(name: "cat_name")
	late String catName = '';
	late String home = '';
	@JSONField(name: "image_url")
	late String imageUrl = '';
	@JSONField(name: "Tags")
	late String tags = '';
	late int bai = 0;
	late PromotionBeanListChildProduct product;
	late List<String> album = [];
	late bool isfav = false;
	late List<PromotionBeanListChildCanshu> canshu = [];
	dynamic category;

	PromotionBeanListChild();

	factory PromotionBeanListChild.fromJson(Map<String, dynamic> json) => $PromotionBeanListChildFromJson(json);

	Map<String, dynamic> toJson() => $PromotionBeanListChildToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PromotionBeanListChildProduct {
	late int id = 0;
	@JSONField(name: "goods_id")
	late int goodsId = 0;
	dynamic barcode;
	late String sn = '';
	late String price = '';
	late String mktprice = '';
	late int marketable = 0;
	late int stock = 0;
	@JSONField(name: "spes_desc")
	dynamic spesDesc;
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
	late List<dynamic> gradeInfo = [];
	late String amount = '';
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	@JSONField(name: "promotion_amount")
	late int promotionAmount = 0;

	PromotionBeanListChildProduct();

	factory PromotionBeanListChildProduct.fromJson(Map<String, dynamic> json) => $PromotionBeanListChildProductFromJson(json);

	Map<String, dynamic> toJson() => $PromotionBeanListChildProductToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PromotionBeanListChildCanshu {
	late int id = 0;
	@JSONField(name: "goods_id")
	late int goodsId = 0;
	late String value = '';
	dynamic sort;

	PromotionBeanListChildCanshu();

	factory PromotionBeanListChildCanshu.fromJson(Map<String, dynamic> json) => $PromotionBeanListChildCanshuFromJson(json);

	Map<String, dynamic> toJson() => $PromotionBeanListChildCanshuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}