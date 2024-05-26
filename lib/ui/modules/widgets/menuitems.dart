import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItems extends StatelessWidget {
  final String x;
  final String y;

  const MenuItems({super.key, required this.x, required this.y});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go(x);
      },
      child: Text(y),
    );
  }
}
