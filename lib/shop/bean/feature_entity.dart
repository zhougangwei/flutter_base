import 'package:abce/generated/json/base/json_field.dart';
import 'package:abce/generated/json/feature_entity.g.dart';
import 'dart:convert';
export 'package:abce/generated/json/feature_entity.g.dart';

@JsonSerializable()
class FeatureEntity {
	late int id;
	late String bn = '';
	late String name = '';
	late String cat_name = '';
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
	late String params = '';
	@JSONField(name: "comments_count")
	late double commentsCount;
	@JSONField(name: "view_count")
	late double viewCount;
	late String image_url = '';
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
	dynamic ctime;
	late double utime;
	dynamic isdel;
	@JSONField(name: "is_combo")
	late double isCombo;
	@JSONField(name: "category_id")
	late double categoryId;
	@JSONField(name: "score_sum")
	late String scoreSum = '';
	late FeatureProduct product;
	late List<String> album = [];
	late bool isfav = false;
	late List<FeatureCanshu> canshu = [];
	dynamic category;

	FeatureEntity();

	factory FeatureEntity.fromJson(Map<String, dynamic> json) => $FeatureEntityFromJson(json);

	Map<String, dynamic> toJson() => $FeatureEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeatureProduct {
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
	late String spesDesc = '';
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

	late String amount = '';
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	@JSONField(name: "promotion_amount")
	late double promotionAmount;

	FeatureProduct();

	factory FeatureProduct.fromJson(Map<String, dynamic> json) => $FeatureProductFromJson(json);

	Map<String, dynamic> toJson() => $FeatureProductToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class FeatureCanshu {
	late int id;
	@JSONField(name: "goods_id")
	late double goodsId;
	late String value = '';
	dynamic sort;

	FeatureCanshu();

	factory FeatureCanshu.fromJson(Map<String, dynamic> json) => $FeatureCanshuFromJson(json);

	Map<String, dynamic> toJson() => $FeatureCanshuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}