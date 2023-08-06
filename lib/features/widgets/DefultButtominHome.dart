import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefultButtomInHomePage extends StatelessWidget {
  DefultButtomInHomePage({super.key, required this.ontap, required this.text});
  VoidCallback? ontap;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 55.0.h,
          width: 192.0.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.white, style: BorderStyle.solid),
            color: Colors.transparent,
          ),
          child: MaterialButton(
            onPressed: ontap,
            child: Center(
              child: Text(
                text!,
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 25.0.sp,
                    fontFamily: 'Nova Oval'),
              ),
            ),
          )),
    );
  }
}
