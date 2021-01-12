import 'package:dolinger_test_flutter_app/model/basket.dart';
import 'package:dolinger_test_flutter_app/model/basketItem.dart';
// import 'package:dolinger_test_flutter_app/model/product.dart';
import 'package:dolinger_test_flutter_app/repository/BasketRepository.dart';
// import 'package:dolinger_test_flutter_app/repository/ProductRepository.dart';
import 'package:dolinger_test_flutter_app/repository/ProductRepositoryImplementation.dart';

class BasketRepositoryImplementation extends BasketRepository {
  @override
  Future<Basket> getBasket() {
    // TODO: implement getBasket
    throw UnimplementedError();
  }

  @override
  Future<Basket> generateBasket(int countProducts) async {
    Basket basket = new Basket();
    basket.items = new List<BasketItem>();
    for (int i = 1; i <= countProducts; i++) {
      BasketItem item = new BasketItem();
      // item.product = new Product();
      item.product = await ProductRepositoryImplementation().getProduct(i);
      item.count = 0;
      basket.items.add(item);
    }
    return basket;
  }
}