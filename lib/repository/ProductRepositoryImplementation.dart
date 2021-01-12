import 'dart:convert';

import 'package:dolinger_test_flutter_app/model/product.dart';
import 'package:dolinger_test_flutter_app/repository/ProductRepository.dart';
import 'package:flutter/services.dart';

class ProductRepositoryImplementation extends ProductRepository {


  @override
  Future<Product> getProduct(int productNumber) async {
    final raw = await _getRawProduct(productNumber);
    final Map<String, dynamic> decoded = jsonDecode(raw);
    final result = Product.fromJson(decoded);
    return result;
  }

  Future<String> _getRawProduct(int productNumber) {
    return rootBundle.loadString('assets/products//product$productNumber.json');
  }

}