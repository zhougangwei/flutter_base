import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/qr_bean_entity.dart';

QrBeanEntity $QrBeanEntityFromJson(Map<String, dynamic> json) {
  final QrBeanEntity qrBeanEntity = QrBeanEntity();
  final String? qrCodeId = jsonConvert.convert<String>(json['qr_code_id']);
  if (qrCodeId != null) {
    qrBeanEntity.qrCodeId = qrCodeId;
  }
  final String? qrCodes = jsonConvert.convert<String>(json['qr_codes']);
  if (qrCodes != null) {
    qrBeanEntity.qrCodes = qrCodes;
  }
  final String? qrCode = jsonConvert.convert<String>(json['qr_code']);
  if (qrCode != null) {
    qrBeanEntity.qrCode = qrCode;
  }
  return qrBeanEntity;
}

Map<String, dynamic> $QrBeanEntityToJson(QrBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['qr_code_id'] = entity.qrCodeId;
  data['qr_codes'] = entity.qrCodes;
  data['qr_code'] = entity.qrCode;
  return data;
}

extension QrBeanEntityExtension on QrBeanEntity {
  QrBeanEntity copyWith({
    String? qrCodeId,
    String? qrCodes,
    String? qrCode,
  }) {
    return QrBeanEntity()
      ..qrCodeId = qrCodeId ?? this.qrCodeId
      ..qrCodes = qrCodes ?? this.qrCodes
      ..qrCode = qrCode ?? this.qrCode;
  }
}