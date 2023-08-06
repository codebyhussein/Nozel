import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DfultItemInMenu extends StatelessWidget {
  DfultItemInMenu(
      {super.key,
      required this.NameOfPage,
      required this.text,
      required this.icondata});
  dynamic NameOfPage;
  String text;
  IconData icondata;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NameOfPage),
        );
      },
      child: Row(
        children: [
          Icon(
            icondata,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          )
        ],
      ),
    );
  }
}
