import 'package:flutter/material.dart';
import 'package:solesmates/models/product_model.dart';
import 'package:solesmates/screens/product_screen.dart';
import 'package:solesmates/utils/constants.dart';
import 'package:solesmates/widgets/fav_icon.dart';
import 'package:solesmates/widgets/star_ratingwidget.dart';

class WProductCard extends StatelessWidget {
  final ProductModel product;

  const WProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return ProductScreen(product: product);
      })),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        height: 200,
        width: 150,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (product.discount != null)
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0XFF92c6df),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        product.discount.toString() + '%',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  const Spacer(),
                  WIconFavorite(
                    product: product,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    height: 100,
                    width: 120,
                    decoration: BoxDecoration(
                      color: product.bgColour,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 5,
                    child: Image.asset(
                      product.photoURLs[0],
                      height: 85,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    Constants.currencySymbol,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    product.price.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WRatingStar(
                    color: Colors.amber,
                    rating: product.rating,
                    onRatingChanged: (val) {},
                  ),
                  Text(
                    '(${product.rating})',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
