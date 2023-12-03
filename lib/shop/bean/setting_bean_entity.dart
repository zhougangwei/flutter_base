import 'package:abce/generated/json/base/json_field.dart';
import 'package:abce/generated/json/setting_bean_entity.g.dart';
import 'dart:convert';
export 'package:abce/generated/json/setting_bean_entity.g.dart';

@JsonSerializable()
class SettingBeanEntity {
	@JSONField(name: "about_article")
	late String aboutArticle = '';
	@JSONField(name: "about_article_id")
	late String aboutArticleId = '';
	@JSONField(name: "App_channeid")
	late String appChanneid = '';
	@JSONField(name: "continuity_sign_additional")
	late String continuitySignAdditional = '';
	@JSONField(name: "ent_id")
	late String entId = '';
	@JSONField(name: "first_sign_point")
	late String firstSignPoint = '';
	@JSONField(name: "image_storage_params")
	late String imageStorageParams = '';
	@JSONField(name: "image_storage_type")
	late String imageStorageType = '';
	@JSONField(name: "kuaidi100_customer")
	late String kuaidi100Customer = '';
	@JSONField(name: "kuaidi100_key")
	late String kuaidi100Key = '';
	@JSONField(name: "office_1")
	late String office1 = '';
	@JSONField(name: "office_2")
	late String office2 = '';
	@JSONField(name: "office_3")
	late String office3 = '';
	@JSONField(name: "office_address")
	late String officeAddress = '';
	@JSONField(name: "office_Email")
	late String officeEmail = '';
	@JSONField(name: "office_Phone")
	late String officePhone = '';
	@JSONField(name: "Official_channeid")
	late String officialChanneid = '';
	@JSONField(name: "orders_point_proportion")
	late String ordersPointProportion = '';
	@JSONField(name: "orders_reward_proportion")
	late String ordersRewardProportion = '';
	@JSONField(name: "point_discounted_proportion")
	late String pointDiscountedProportion = '';
	@JSONField(name: "point_switch")
	late String pointSwitch = '';
	@JSONField(name: "privacy_policy")
	late String privacyPolicy = '';
	@JSONField(name: "privacy_policy_id")
	late String privacyPolicyId = '';
	@JSONField(name: "qq_map_key")
	late String qqMapKey = '';
	@JSONField(name: "shop_address")
	late String shopAddress = '';
	@JSONField(name: "shop_beian")
	late String shopBeian = '';
	@JSONField(name: "shop_content")
	late String shopContent = '';
	@JSONField(name: "shop_default_image")
	late String shopDefaultImage = '';
	@JSONField(name: "shop_desc")
	late String shopDesc = '';
	@JSONField(name: "shop_email")
	late String shopEmail = '';
	@JSONField(name: "shop_logo")
	late String shopLogo = '';
	@JSONField(name: "shop_mobile")
	late String shopMobile = '';
	@JSONField(name: "shop_mobile1")
	late String shopMobile1 = '';
	@JSONField(name: "shop_name")
	late String shopName = '';
	@JSONField(name: "shop_time")
	late String shopTime = '';
	@JSONField(name: "sign_most_point")
	late String signMostPoint = '';
	@JSONField(name: "sign_point_type")
	late String signPointType = '';
	@JSONField(name: "sign_random_max")
	late String signRandomMax = '';
	@JSONField(name: "sign_random_min")
	late String signRandomMin = '';
	@JSONField(name: "Smallapp_channeid")
	late String smallappChanneid = '';
	@JSONField(name: "user_agreement")
	late String userAgreement = '';
	@JSONField(name: "user_agreement_id")
	late String userAgreementId = '';
	@JSONField(name: "Web_channeid")
	late String webChanneid = '';

	SettingBeanEntity();

	factory SettingBeanEntity.fromJson(Map<String, dynamic> json) => $SettingBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $SettingBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}