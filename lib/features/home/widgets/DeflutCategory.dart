import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/DefultButtom.dart';

class DeflutCategory extends StatelessWidget {
  DeflutCategory(
      {super.key,
      required this.image,
      required this.text,
      required this.textinButtom,
      required this.ontap});
  String textinButtom;
  String image;
  String text;
  VoidCallback ontap;
//
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Image.asset(image),
              SizedBox(
                width: 40.w,
              ),
              Column(
                children: [
                  Container(
                    width: 170.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.black, fontSize: 25.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                    child: SizedBox(
                      width: 140.w,
                      child: DafultButtom(
                        text: textinButtom,
                        ontap: ontap,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 115.w),
          child: Divider(
            height: 1.h,
            endIndent: 0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
