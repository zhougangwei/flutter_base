import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/setting_bean_entity.dart';

SettingBeanEntity $SettingBeanEntityFromJson(Map<String, dynamic> json) {
  final SettingBeanEntity settingBeanEntity = SettingBeanEntity();
  final String? aboutArticle = jsonConvert.convert<String>(
      json['about_article']);
  if (aboutArticle != null) {
    settingBeanEntity.aboutArticle = aboutArticle;
  }
  final String? aboutArticleId = jsonConvert.convert<String>(
      json['about_article_id']);
  if (aboutArticleId != null) {
    settingBeanEntity.aboutArticleId = aboutArticleId;
  }
  final String? appChanneid = jsonConvert.convert<String>(json['App_channeid']);
  if (appChanneid != null) {
    settingBeanEntity.appChanneid = appChanneid;
  }
  final String? continuitySignAdditional = jsonConvert.convert<String>(
      json['continuity_sign_additional']);
  if (continuitySignAdditional != null) {
    settingBeanEntity.continuitySignAdditional = continuitySignAdditional;
  }
  final String? entId = jsonConvert.convert<String>(json['ent_id']);
  if (entId != null) {
    settingBeanEntity.entId = entId;
  }
  final String? firstSignPoint = jsonConvert.convert<String>(
      json['first_sign_point']);
  if (firstSignPoint != null) {
    settingBeanEntity.firstSignPoint = firstSignPoint;
  }
  final String? imageStorageParams = jsonConvert.convert<String>(
      json['image_storage_params']);
  if (imageStorageParams != null) {
    settingBeanEntity.imageStorageParams = imageStorageParams;
  }
  final String? imageStorageType = jsonConvert.convert<String>(
      json['image_storage_type']);
  if (imageStorageType != null) {
    settingBeanEntity.imageStorageType = imageStorageType;
  }
  final String? kuaidi100Customer = jsonConvert.convert<String>(
      json['kuaidi100_customer']);
  if (kuaidi100Customer != null) {
    settingBeanEntity.kuaidi100Customer = kuaidi100Customer;
  }
  final String? kuaidi100Key = jsonConvert.convert<String>(
      json['kuaidi100_key']);
  if (kuaidi100Key != null) {
    settingBeanEntity.kuaidi100Key = kuaidi100Key;
  }
  final String? office1 = jsonConvert.convert<String>(json['office_1']);
  if (office1 != null) {
    settingBeanEntity.office1 = office1;
  }
  final String? office2 = jsonConvert.convert<String>(json['office_2']);
  if (office2 != null) {
    settingBeanEntity.office2 = office2;
  }
  final String? office3 = jsonConvert.convert<String>(json['office_3']);
  if (office3 != null) {
    settingBeanEntity.office3 = office3;
  }
  final String? officeAddress = jsonConvert.convert<String>(
      json['office_address']);
  if (officeAddress != null) {
    settingBeanEntity.officeAddress = officeAddress;
  }
  final String? officeEmail = jsonConvert.convert<String>(json['office_Email']);
  if (officeEmail != null) {
    settingBeanEntity.officeEmail = officeEmail;
  }
  final String? officePhone = jsonConvert.convert<String>(json['office_Phone']);
  if (officePhone != null) {
    settingBeanEntity.officePhone = officePhone;
  }
  final String? officialChanneid = jsonConvert.convert<String>(
      json['Official_channeid']);
  if (officialChanneid != null) {
    settingBeanEntity.officialChanneid = officialChanneid;
  }
  final String? ordersPointProportion = jsonConvert.convert<String>(
      json['orders_point_proportion']);
  if (ordersPointProportion != null) {
    settingBeanEntity.ordersPointProportion = ordersPointProportion;
  }
  final String? ordersRewardProportion = jsonConvert.convert<String>(
      json['orders_reward_proportion']);
  if (ordersRewardProportion != null) {
    settingBeanEntity.ordersRewardProportion = ordersRewardProportion;
  }
  final String? pointDiscountedProportion = jsonConvert.convert<String>(
      json['point_discounted_proportion']);
  if (pointDiscountedProportion != null) {
    settingBeanEntity.pointDiscountedProportion = pointDiscountedProportion;
  }
  final String? pointSwitch = jsonConvert.convert<String>(json['point_switch']);
  if (pointSwitch != null) {
    settingBeanEntity.pointSwitch = pointSwitch;
  }
  final String? privacyPolicy = jsonConvert.convert<String>(
      json['privacy_policy']);
  if (privacyPolicy != null) {
    settingBeanEntity.privacyPolicy = privacyPolicy;
  }
  final String? privacyPolicyId = jsonConvert.convert<String>(
      json['privacy_policy_id']);
  if (privacyPolicyId != null) {
    settingBeanEntity.privacyPolicyId = privacyPolicyId;
  }
  final String? qqMapKey = jsonConvert.convert<String>(json['qq_map_key']);
  if (qqMapKey != null) {
    settingBeanEntity.qqMapKey = qqMapKey;
  }
  final String? shopAddress = jsonConvert.convert<String>(json['shop_address']);
  if (shopAddress != null) {
    settingBeanEntity.shopAddress = shopAddress;
  }
  final String? shopBeian = jsonConvert.convert<String>(json['shop_beian']);
  if (shopBeian != null) {
    settingBeanEntity.shopBeian = shopBeian;
  }
  final String? shopContent = jsonConvert.convert<String>(json['shop_content']);
  if (shopContent != null) {
    settingBeanEntity.shopContent = shopContent;
  }
  final String? shopDefaultImage = jsonConvert.convert<String>(
      json['shop_default_image']);
  if (shopDefaultImage != null) {
    settingBeanEntity.shopDefaultImage = shopDefaultImage;
  }
  final String? shopDesc = jsonConvert.convert<String>(json['shop_desc']);
  if (shopDesc != null) {
    settingBeanEntity.shopDesc = shopDesc;
  }
  final String? shopEmail = jsonConvert.convert<String>(json['shop_email']);
  if (shopEmail != null) {
    settingBeanEntity.shopEmail = shopEmail;
  }
  final String? shopLogo = jsonConvert.convert<String>(json['shop_logo']);
  if (shopLogo != null) {
    settingBeanEntity.shopLogo = shopLogo;
  }
  final String? shopMobile = jsonConvert.convert<String>(json['shop_mobile']);
  if (shopMobile != null) {
    settingBeanEntity.shopMobile = shopMobile;
  }
  final String? shopMobile1 = jsonConvert.convert<String>(json['shop_mobile1']);
  if (shopMobile1 != null) {
    settingBeanEntity.shopMobile1 = shopMobile1;
  }
  final String? shopName = jsonConvert.convert<String>(json['shop_name']);
  if (shopName != null) {
    settingBeanEntity.shopName = shopName;
  }
  final String? shopTime = jsonConvert.convert<String>(json['shop_time']);
  if (shopTime != null) {
    settingBeanEntity.shopTime = shopTime;
  }
  final String? signMostPoint = jsonConvert.convert<String>(
      json['sign_most_point']);
  if (signMostPoint != null) {
    settingBeanEntity.signMostPoint = signMostPoint;
  }
  final String? signPointType = jsonConvert.convert<String>(
      json['sign_point_type']);
  if (signPointType != null) {
    settingBeanEntity.signPointType = signPointType;
  }
  final String? signRandomMax = jsonConvert.convert<String>(
      json['sign_random_max']);
  if (signRandomMax != null) {
    settingBeanEntity.signRandomMax = signRandomMax;
  }
  final String? signRandomMin = jsonConvert.convert<String>(
      json['sign_random_min']);
  if (signRandomMin != null) {
    settingBeanEntity.signRandomMin = signRandomMin;
  }
  final String? smallappChanneid = jsonConvert.convert<String>(
      json['Smallapp_channeid']);
  if (smallappChanneid != null) {
    settingBeanEntity.smallappChanneid = smallappChanneid;
  }
  final String? userAgreement = jsonConvert.convert<String>(
      json['user_agreement']);
  if (userAgreement != null) {
    settingBeanEntity.userAgreement = userAgreement;
  }
  final String? userAgreementId = jsonConvert.convert<String>(
      json['user_agreement_id']);
  if (userAgreementId != null) {
    settingBeanEntity.userAgreementId = userAgreementId;
  }
  final String? webChanneid = jsonConvert.convert<String>(json['Web_channeid']);
  if (webChanneid != null) {
    settingBeanEntity.webChanneid = webChanneid;
  }
  return settingBeanEntity;
}

Map<String, dynamic> $SettingBeanEntityToJson(SettingBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['about_article'] = entity.aboutArticle;
  data['about_article_id'] = entity.aboutArticleId;
  data['App_channeid'] = entity.appChanneid;
  data['continuity_sign_additional'] = entity.continuitySignAdditional;
  data['ent_id'] = entity.entId;
  data['first_sign_point'] = entity.firstSignPoint;
  data['image_storage_params'] = entity.imageStorageParams;
  data['image_storage_type'] = entity.imageStorageType;
  data['kuaidi100_customer'] = entity.kuaidi100Customer;
  data['kuaidi100_key'] = entity.kuaidi100Key;
  data['office_1'] = entity.office1;
  data['office_2'] = entity.office2;
  data['office_3'] = entity.office3;
  data['office_address'] = entity.officeAddress;
  data['office_Email'] = entity.officeEmail;
  data['office_Phone'] = entity.officePhone;
  data['Official_channeid'] = entity.officialChanneid;
  data['orders_point_proportion'] = entity.ordersPointProportion;
  data['orders_reward_proportion'] = entity.ordersRewardProportion;
  data['point_discounted_proportion'] = entity.pointDiscountedProportion;
  data['point_switch'] = entity.pointSwitch;
  data['privacy_policy'] = entity.privacyPolicy;
  data['privacy_policy_id'] = entity.privacyPolicyId;
  data['qq_map_key'] = entity.qqMapKey;
  data['shop_address'] = entity.shopAddress;
  data['shop_beian'] = entity.shopBeian;
  data['shop_content'] = entity.shopContent;
  data['shop_default_image'] = entity.shopDefaultImage;
  data['shop_desc'] = entity.shopDesc;
  data['shop_email'] = entity.shopEmail;
  data['shop_logo'] = entity.shopLogo;
  data['shop_mobile'] = entity.shopMobile;
  data['shop_mobile1'] = entity.shopMobile1;
  data['shop_name'] = entity.shopName;
  data['shop_time'] = entity.shopTime;
  data['sign_most_point'] = entity.signMostPoint;
  data['sign_point_type'] = entity.signPointType;
  data['sign_random_max'] = entity.signRandomMax;
  data['sign_random_min'] = entity.signRandomMin;
  data['Smallapp_channeid'] = entity.smallappChanneid;
  data['user_agreement'] = entity.userAgreement;
  data['user_agreement_id'] = entity.userAgreementId;
  data['Web_channeid'] = entity.webChanneid;
  return data;
}

extension SettingBeanEntityExtension on SettingBeanEntity {
  SettingBeanEntity copyWith({
    String? aboutArticle,
    String? aboutArticleId,
    String? appChanneid,
    String? continuitySignAdditional,
    String? entId,
    String? firstSignPoint,
    String? imageStorageParams,
    String? imageStorageType,
    String? kuaidi100Customer,
    String? kuaidi100Key,
    String? office1,
    String? office2,
    String? office3,
    String? officeAddress,
    String? officeEmail,
    String? officePhone,
    String? officialChanneid,
    String? ordersPointProportion,
    String? ordersRewardProportion,
    String? pointDiscountedProportion,
    String? pointSwitch,
    String? privacyPolicy,
    String? privacyPolicyId,
    String? qqMapKey,
    String? shopAddress,
    String? shopBeian,
    String? shopContent,
    String? shopDefaultImage,
    String? shopDesc,
    String? shopEmail,
    String? shopLogo,
    String? shopMobile,
    String? shopMobile1,
    String? shopName,
    String? shopTime,
    String? signMostPoint,
    String? signPointType,
    String? signRandomMax,
    String? signRandomMin,
    String? smallappChanneid,
    String? userAgreement,
    String? userAgreementId,
    String? webChanneid,
  }) {
    return SettingBeanEntity()
      ..aboutArticle = aboutArticle ?? this.aboutArticle
      ..aboutArticleId = aboutArticleId ?? this.aboutArticleId
      ..appChanneid = appChanneid ?? this.appChanneid
      ..continuitySignAdditional = continuitySignAdditional ??
          this.continuitySignAdditional
      ..entId = entId ?? this.entId
      ..firstSignPoint = firstSignPoint ?? this.firstSignPoint
      ..imageStorageParams = imageStorageParams ?? this.imageStorageParams
      ..imageStorageType = imageStorageType ?? this.imageStorageType
      ..kuaidi100Customer = kuaidi100Customer ?? this.kuaidi100Customer
      ..kuaidi100Key = kuaidi100Key ?? this.kuaidi100Key
      ..office1 = office1 ?? this.office1
      ..office2 = office2 ?? this.office2
      ..office3 = office3 ?? this.office3
      ..officeAddress = officeAddress ?? this.officeAddress
      ..officeEmail = officeEmail ?? this.officeEmail
      ..officePhone = officePhone ?? this.officePhone
      ..officialChanneid = officialChanneid ?? this.officialChanneid
      ..ordersPointProportion = ordersPointProportion ??
          this.ordersPointProportion
      ..ordersRewardProportion = ordersRewardProportion ??
          this.ordersRewardProportion
      ..pointDiscountedProportion = pointDiscountedProportion ??
          this.pointDiscountedProportion
      ..pointSwitch = pointSwitch ?? this.pointSwitch
      ..privacyPolicy = privacyPolicy ?? this.privacyPolicy
      ..privacyPolicyId = privacyPolicyId ?? this.privacyPolicyId
      ..qqMapKey = qqMapKey ?? this.qqMapKey
      ..shopAddress = shopAddress ?? this.shopAddress
      ..shopBeian = shopBeian ?? this.shopBeian
      ..shopContent = shopContent ?? this.shopContent
      ..shopDefaultImage = shopDefaultImage ?? this.shopDefaultImage
      ..shopDesc = shopDesc ?? this.shopDesc
      ..shopEmail = shopEmail ?? this.shopEmail
      ..shopLogo = shopLogo ?? this.shopLogo
      ..shopMobile = shopMobile ?? this.shopMobile
      ..shopMobile1 = shopMobile1 ?? this.shopMobile1
      ..shopName = shopName ?? this.shopName
      ..shopTime = shopTime ?? this.shopTime
      ..signMostPoint = signMostPoint ?? this.signMostPoint
      ..signPointType = signPointType ?? this.signPointType
      ..signRandomMax = signRandomMax ?? this.signRandomMax
      ..signRandomMin = signRandomMin ?? this.signRandomMin
      ..smallappChanneid = smallappChanneid ?? this.smallappChanneid
      ..userAgreement = userAgreement ?? this.userAgreement
      ..userAgreementId = userAgreementId ?? this.userAgreementId
      ..webChanneid = webChanneid ?? this.webChanneid;
  }
}