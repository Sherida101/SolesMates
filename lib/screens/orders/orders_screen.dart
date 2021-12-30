import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:solesmates/screens/cart/widgets/custom_divider_view.dart';
import 'package:solesmates/screens/orders/widgets/dotted_seperator_view.dart';
import 'package:solesmates/themes/colours.dart';
import 'package:solesmates/utils/constants.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Sea Emperor',
      'Fireflies Restaurant',
      'Chai Truck',
    ];

    final List<String> foods = [
      'Pepper BBQ x 1',
      'Chicken Noodles x 1',
      'Milk Tea x 1',
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => OrderItem(
            category: categories[index],
            orderItem: foods[index],
          ),
        ),
        TextButton(
          child: Text(
            'VIEW MORE ORDERS',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: AppColours.darkOrange),
          ),
          onPressed: () {},
        ),
        Constants.verticalSpaceSmall(),
        const CustomDividerView(),
        Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10.0),
              height: 50.0,
              child: Text(
                'LOGOUT',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 16.0),
              ),
            ),
            const Spacer(),
            const Icon(Icons.power_settings_new),
            Constants.horizontalSpaceSmall(),
          ],
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 20.0),
          height: 130.0,
          color: Colors.grey[200],
          child: Text(
            'App Version v3.2.0',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.grey[700], fontSize: 13.0),
          ),
        )
      ],
    );
  }
}

class OrderItem extends StatelessWidget {
  final String category;
  final String orderItem;

  const OrderItem({
    Key key,
    @required this.category,
    @required this.orderItem,
  })  : assert(category != '', orderItem != ''),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentDateTime = DateFormat.jm().format(DateTime.now());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      category,
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Constants.verticalSpaceExtraSmall(),
                    Text(
                      'Medavakkam',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 12.0),
                    ),
                    Constants.verticalSpaceSmall(),
                    Row(
                      children: <Widget>[
                        const Text('${Constants.currencySymbol}112'),
                        Constants.horizontalSpaceExtraSmall(),
                        Icon(Icons.keyboard_arrow_right,
                            color: Colors.grey[600])
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Text('Delivered', style: Theme.of(context).textTheme.subtitle2),
                Constants.horizontalSpaceSmall(),
                ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(2.2),
                    color: Colors.green,
                    child: const Icon(Icons.check,
                        color: Colors.white, size: 14.0),
                  ),
                )
              ],
            ),
          ),
          Constants.verticalSpaceSmall(),
          const DottedSeperatorView(),
          Constants.verticalSpaceMedium(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(orderItem),
              Constants.verticalSpaceExtraSmall(),
              Text(currentDateTime.toString()),
              Constants.verticalSpaceSmall(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                width: 1.5, color: AppColours.darkOrange),
                          ),
                          child: Text(
                            'REORDER',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: AppColours.darkOrange),
                          ),
                          onPressed: () {},
                        ),
                        Constants.verticalSpaceMedium(),
                        const Text(
                          'Delivery rating not\napplicable for this order',
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                  Constants.horizontalSpaceMedium(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          child: Text(
                            'RATE FOOD',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                        Constants.verticalSpaceMedium(),
                        const Text("You haven't rated\nthis food yet")
                      ],
                    ),
                  )
                ],
              ),
              Constants.verticalSpaceMedium(),
              const CustomDividerView(dividerHeight: 1.5, color: Colors.black)
            ],
          )
        ],
      ),
    );
  }
}
