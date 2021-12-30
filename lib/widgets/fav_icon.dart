import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solesmates/models/product_model.dart';

import '../utils/app_providers.dart';

class WIconFavorite extends StatelessWidget {
  final ProductModel product;

  const WIconFavorite({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProvProducts>(
      builder: (_, data, ch) {
        return GestureDetector(
          onTap: () {
            data.setFavouriteProduct(product);
          },
          child: CircleAvatar(
            backgroundColor: product.isFavourite ? Colors.red : Colors.white,
            child: Icon(Icons.favorite,
                color: product.isFavourite ? Colors.white : Colors.grey),
            minRadius: 16,
          ),
        );
      },
    );
  }
}
