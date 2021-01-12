import 'package:dolinger_test_flutter_app/model/basket.dart';

abstract class BasketRepository {
  Future<Basket> getBasket();

  Future<Basket> generateBasket(int countProducts);
}
