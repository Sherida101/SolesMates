import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final Widget title, leading;

  const MyAppBar({Key key, 
    @required this.title,
    @required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: leading,
      // leading: IconButton(
      //   icon: Icon(leadIcon),
      //   onPressed: ,
      //   onPressed: () => scaffoldKey.currentState.openDrawer(),
      // ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
      title: title,
    );
  }
}
