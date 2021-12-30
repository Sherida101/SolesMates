import 'package:flutter/material.dart';

class WBadge extends StatelessWidget {
  const WBadge({
    Key key,
    @required this.child,
    @required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        value == '0'
            ? Ink()
            : Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        color ?? Theme.of(context).colorScheme.secondary,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    value.length > 3 ? '99+' : value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
      ],
    );
  }
}
