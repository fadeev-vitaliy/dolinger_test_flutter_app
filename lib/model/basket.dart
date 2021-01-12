import 'package:dolinger_test_flutter_app/model/basketItem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket.g.dart';

@JsonSerializable()
class Basket {
  List<BasketItem> items;

  Basket({
    this.items,
  });

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);

  Map<String, dynamic> toJson() => _$BasketToJson(this);
}
