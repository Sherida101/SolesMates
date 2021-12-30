import 'package:flutter/material.dart';
import 'package:solesmates/models/product_model.dart';
import 'package:solesmates/utils/constants.dart';

class ClearanceSaleListItemView extends StatelessWidget {
  const ClearanceSaleListItemView({
    Key key,
    @required this.productInfo,
  }) : super(key: key);

  final ProductModel productInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                )
              ],
            ),
            child: Image.asset(
              productInfo.photoURLs[0],
              height: 80.0,
              width: 80.0,
              fit: BoxFit.fill,
            ),
          ),
          Constants.horizontalSpaceSmall(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productInfo.name,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontSize: 15.0),
                ),
                Text(productInfo.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey[600], fontSize: 13.5)),
                Constants.verticalSpaceSmall(),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 14.0,
                      color: Colors.grey[600],
                    ),
                    Text(
                        '${productInfo.rating} ${Constants.currencySymbol}${productInfo.price}')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
