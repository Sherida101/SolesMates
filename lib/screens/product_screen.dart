import 'package:flutter/material.dart';
import 'package:solesmates/models/product_model.dart';
import 'package:solesmates/utils/constants.dart';
import 'package:solesmates/widgets/badge_item.dart';
import 'package:solesmates/widgets/divider_widget.dart';
import 'package:solesmates/widgets/fav_icon.dart';
import 'package:solesmates/widgets/indicator_carousel.dart';
import 'package:solesmates/widgets/title_appbarwidget.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;

  const ProductScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<ProductScreen> {
  int _currentSize = 0, _currImg = 0;

  void _changeSize(int i) {
    setState(() {
      _currentSize = i;
    });
  }

  void _next() {
    setState(() {
      if (_currImg < widget.product.photoURLs.length - 1) {
        _currImg++;
      } else {
        _currImg = 0;
      }
    });
  }

  void _prev() {
    setState(() {
      if (_currImg > 0) {
        _currImg--;
      } else {
        _currImg = widget.product.photoURLs.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TitleAppBar(),
        actions: [
          WIconFavorite(
            product: widget.product,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (widget.product.discount != null)
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0XFF92c6df),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          widget.product.discount.toString() + '%',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.velocity.pixelsPerSecond.dx > 0) {
                        _prev();
                      } else if (details.velocity.pixelsPerSecond.dx < 0) {
                        _next();
                      }
                    },
                    child: SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  widget.product.bgColour.withOpacity(.1),
                                  Theme.of(context).scaffoldBackgroundColor,
                                  Theme.of(context).scaffoldBackgroundColor,
                                  widget.product.bgColour.withOpacity(.1),
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(40),
                              decoration: BoxDecoration(
                                color: widget.product.bgColour,
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(40),
                                decoration: BoxDecoration(
                                  color: const Color(0XFFfeebde),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Image.asset(
                              widget.product.photoURLs[_currImg],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: 100,
                              child: Row(
                                children: _getIndicators,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const WMyDivider(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: Row(
                      children: [
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '(${widget.product.rating})',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 5,
                    ),
                    child: Text(
                      widget.product.description,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Text(
                      'Size : ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                    title: Row(
                        children:
                            List.generate(widget.product.sizes.length, (index) {
                      return WBadgeItem(
                        text: widget.product.sizes[index],
                        index: index,
                        onTap: _changeSize,
                        isActive: _currentSize == index,
                      );
                    }).toList()),
                  ),
                  ListTile(
                    leading: const Text(
                      'Available Colours : ',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 12,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.product.colours
                          .map((color) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        offset: const Offset(0, -1),
                                        blurRadius: 9,
                                        spreadRadius: 4,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    color: color,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                      widget.product.price.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF4e55af),
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0XFFf7f7f7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      textStyle: const TextStyle(
                        color: Colors.black,
                      )),
                  onPressed: () {
                    setState(() {
                      // if (!_cartList.contains(widget.product)) {
                      // context.read<Cart>().addToCart(widget.product);
                      // } else {
                      //   context.read<Cart>().removeFromCart(widget.product);
                      // }
                    });
                  },
                  label: const Text(
                    // _cartList.contains(widget.product)
                    //     ? 'Remove from cart'
                    // :
                    'Add To Cart',
                    style: TextStyle(
                      color: Color(0XFF4e55af),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color(0XFF4e55af),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<WIndicatorCarousel> get _getIndicators {
    List<WIndicatorCarousel> _indicators = <WIndicatorCarousel>[];
    for (var i = 0; i < widget.product.photoURLs.length; i++) {
      if (_currImg == i) {
        _indicators.add(const WIndicatorCarousel(isActive: true));
      } else {
        _indicators.add(const WIndicatorCarousel(isActive: false));
      }
    }
    return _indicators;
  }
}
