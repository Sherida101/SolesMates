import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'X',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0XFF484fae),
          fontSize: 18.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'E',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0XFFc4e6f5),
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
