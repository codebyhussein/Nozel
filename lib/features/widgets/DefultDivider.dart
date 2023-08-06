import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefultDivider extends StatelessWidget {
  static final DefultDivider _instance = const DefultDivider._internal();

  const DefultDivider._internal();

  factory DefultDivider() => _instance;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.h,
      endIndent: 0,
      color: Colors.white,
    );
  }
}
