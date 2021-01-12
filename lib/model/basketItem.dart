import 'package:dolinger_test_flutter_app/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basketItem.g.dart';

@JsonSerializable()
class BasketItem {
  Product product;
  int count;

  BasketItem({
    this.product,
    this.count,
  });

  factory BasketItem.fromJson(Map<String, dynamic> json) => _$BasketItemFromJson(json);

  Map<String, dynamic> toJson() => _$BasketItemToJson(this);

}
