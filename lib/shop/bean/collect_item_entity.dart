import 'package:abce/generated/json/base/json_field.dart';
import 'package:abce/generated/json/collect_item_entity.g.dart';
import 'dart:convert';
export 'package:abce/generated/json/collect_item_entity.g.dart';

@JsonSerializable()
class CollectItemEntity {
	late int id = 0;
	@JSONField(name: "goods_id")
	late int goodsId = 0;
	@JSONField(name: "user_id")
	late int userId = 0;
	@JSONField(name: "goods_name")
	late String goodsName = '';
	late int ctime = 0;
	late CollectItemGoods goods;
	@JSONField(name: "score_sum")
	late int scoreSum = 0;

	CollectItemEntity();

	factory CollectItemEntity.fromJson(Map<String, dynamic> json) => $CollectItemEntityFromJson(json);

	Map<String, dynamic> toJson() => $CollectItemEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CollectItemGoods {
	late int id = 0;
	late String bn = '';
	late String name = '';
	late String brief = '';
	late String price = '';
	late String costprice = '';
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
	@JSONField(name: "freeze_stock")
	late int freezeStock = 0;
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
	dynamic labelIds;
	@JSONField(name: "new_spec")
	late String newSpec = '';
	dynamic ctime;
	late int utime = 0;
	@JSONField(name: "is_combo")
	late int isCombo = 0;
	@JSONField(name: "category_id")
	late int categoryId = 0;
	@JSONField(name: "score_sum")
	late String scoreSum = '';
	@JSONField(name: "image_url")
	late String imageUrl = '';

	CollectItemGoods();

	factory CollectItemGoods.fromJson(Map<String, dynamic> json) => $CollectItemGoodsFromJson(json);

	Map<String, dynamic> toJson() => $CollectItemGoodsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}