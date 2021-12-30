import 'package:flutter/material.dart';
import 'package:solesmates/data/app_repository.dart';
import 'package:solesmates/models/product_model.dart';

class ProvProducts with ChangeNotifier {
  final List<ProductModel> _products = AppRepository.allProducts;
  List<ProductModel> get getProducts => _products;

  void setFavouriteProduct(ProductModel product) {
    product.isFavourite = !product.isFavourite;
    notifyListeners();
  }
}

class Cart with ChangeNotifier {
  List<ProductModel> products = [];

  double get total {
    return products.fold(0.0, (currentTotal, nextProduct) {
      return currentTotal + nextProduct.price;
    });
  }

  void addToCart(ProductModel product) => products.add(product);

  void removeFromCart(ProductModel product) {
    products.remove(product);
    notifyListeners();
  }
}
