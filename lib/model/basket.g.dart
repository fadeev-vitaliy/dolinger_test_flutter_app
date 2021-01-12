// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Basket _$BasketFromJson(Map<String, dynamic> json) {
  return Basket(
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : BasketItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BasketToJson(Basket instance) => <String, dynamic>{
      'items': instance.items,
    };
