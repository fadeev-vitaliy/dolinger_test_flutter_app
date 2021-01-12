// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basketItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketItem _$BasketItemFromJson(Map<String, dynamic> json) {
  return BasketItem(
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
    count: json['count'] as int,
  );
}

Map<String, dynamic> _$BasketItemToJson(BasketItem instance) =>
    <String, dynamic>{
      'product': instance.product,
      'count': instance.count,
    };
