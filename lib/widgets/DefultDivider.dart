import 'package:flutter/material.dart';

class DefultDivider extends StatelessWidget {
  static final DefultDivider _instance = DefultDivider._internal();

  DefultDivider._internal();

  factory DefultDivider() => _instance;

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      endIndent: 0,
      color: Colors.white,
    );
  }
}
