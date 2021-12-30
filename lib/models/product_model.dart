import 'package:flutter/material.dart';

class ProductModel {
  final String productID;
  final String name, description, category, coupon;
  final List<String> sizes, photoURLs;
  final List<Color> colours;
  final double rating, price, discount;
  bool isFavourite;

  final Color bgColour;

  ProductModel({
    this.productID,
    this.name,
    this.description,
    this.coupon,
    this.isFavourite,
    this.category,
    this.sizes,
    this.photoURLs,
    this.colours,
    this.rating,
    this.price,
    this.discount,
    this.bgColour,
  });
}
