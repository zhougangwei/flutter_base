import 'package:atest/generated/json/base/json_convert_content.dart';
import 'package:atest/shop/bean/balance_bean_entity.dart';

BalanceBeanEntity $BalanceBeanEntityFromJson(Map<String, dynamic> json) {
  final BalanceBeanEntity balanceBeanEntity = BalanceBeanEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    balanceBeanEntity.id = id;
  }
  final int? userId = jsonConvert.convert<int>(json['user_id']);
  if (userId != null) {
    balanceBeanEntity.userId = userId;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    balanceBeanEntity.type = type;
  }
  final String? money = jsonConvert.convert<String>(json['money']);
  if (money != null) {
    balanceBeanEntity.money = money;
  }
  final String? balance = jsonConvert.convert<String>(json['balance']);
  if (balance != null) {
    balanceBeanEntity.balance = balance;
  }
  final String? sourceId = jsonConvert.convert<String>(json['source_id']);
  if (sourceId != null) {
    balanceBeanEntity.sourceId = sourceId;
  }
  final String? memo = jsonConvert.convert<String>(json['memo']);
  if (memo != null) {
    balanceBeanEntity.memo = memo;
  }
  final String? ctime = jsonConvert.convert<String>(json['ctime']);
  if (ctime != null) {
    balanceBeanEntity.ctime = ctime;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    balanceBeanEntity.orderId = orderId;
  }
  return balanceBeanEntity;
}

Map<String, dynamic> $BalanceBeanEntityToJson(BalanceBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['type'] = entity.type;
  data['money'] = entity.money;
  data['balance'] = entity.balance;
  data['source_id'] = entity.sourceId;
  data['memo'] = entity.memo;
  data['ctime'] = entity.ctime;
  data['order_id'] = entity.orderId;
  return data;
}

extension BalanceBeanEntityExtension on BalanceBeanEntity {
  BalanceBeanEntity copyWith({
    int? id,
    int? userId,
    String? type,
    String? money,
    String? balance,
    String? sourceId,
    String? memo,
    String? ctime,
    String? orderId,
  }) {
    return BalanceBeanEntity()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..type = type ?? this.type
      ..money = money ?? this.money
      ..balance = balance ?? this.balance
      ..sourceId = sourceId ?? this.sourceId
      ..memo = memo ?? this.memo
      ..ctime = ctime ?? this.ctime
      ..orderId = orderId ?? this.orderId;
  }
}