import 'package:flutter/material.dart';

class WIndicatorCarousel extends StatelessWidget {
  final bool isActive;

  const WIndicatorCarousel({Key key, 
    @required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 5),
        height: 5,
        decoration: BoxDecoration(
          color: const Color(0XFF92c6df),
          shape: isActive ? BoxShape.rectangle : BoxShape.circle,
        ),
      ),
    );
  }
}
