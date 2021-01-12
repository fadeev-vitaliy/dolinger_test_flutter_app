import 'package:dolinger_test_flutter_app/model/product.dart';

abstract class ProductRepository {
  Future<Product> getProduct(int productNumber);
}
