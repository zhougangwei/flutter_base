import 'package:atest/generated/json/base/json_field.dart';
import 'package:atest/generated/json/good_bean_entity.g.dart';
import 'dart:convert';
export 'package:atest/generated/json/good_bean_entity.g.dart';

@JsonSerializable()
class GoodBeanEntity {
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
	late double bai;
	late GoodBeanProduct product;
	late List<String> album = [];
	late bool isfav = false;
	late List<GoodBeanCanshu> canshu = [];
	dynamic category;

	GoodBeanEntity();

	factory GoodBeanEntity.fromJson(Map<String, dynamic> json) => $GoodBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $GoodBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}




@JsonSerializable()
class GoodBeanProduct {
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
	late List<dynamic> gradeInfo = [];
	@JSONField(name: "default_spes_desc")
	late Map<String, dynamic> defaultSpesDesc;
	late String amount = '';
	@JSONField(name: "promotion_list")
	late List<dynamic> promotionList = [];
	@JSONField(name: "promotion_amount")
	late int promotionAmount = 0;

	GoodBeanProduct();

	factory GoodBeanProduct.fromJson(Map<String, dynamic> json) => $GoodBeanProductFromJson(json);

	Map<String, dynamic> toJson() => $GoodBeanProductToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}







@JsonSerializable()
class GoodBeanCanshu {
	late int id = 0;
	@JSONField(name: "goods_id")
	late int goodsId = 0;
	late String value = '';
	dynamic sort;

	GoodBeanCanshu();

	factory GoodBeanCanshu.fromJson(Map<String, dynamic> json) => $GoodBeanCanshuFromJson(json);

	Map<String, dynamic> toJson() => $GoodBeanCanshuToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}