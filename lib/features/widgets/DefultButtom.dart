import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../core/global.dart';
import '../../core/style/colors.dart';

class DafultButtom extends StatelessWidget {
  DafultButtom({super.key, required this.ontap, required this.text});
  VoidCallback? ontap;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 56.0,
          width: 193.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: ButtomColor,
          ),
          child: MaterialButton(
            onPressed: ontap,
            child: Center(
              child: Text(
                text!,
                style: TextStyle(color: insideButtomColor, fontSize: 25.0),
              ),
            ),
          )),
    );
  }
}
