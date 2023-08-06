import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/style/colors.dart';

class AppLogo extends StatelessWidget {
  AppLogo({super.key, required this.hight});
  double hight;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'images/Text1.png',
      height: hight,
      width: double.infinity,
    );
  }
}

class AppHelper {
  static NavigateToNextScreens(BuildContext context, Widget NameOfPage) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NameOfPage),
    );
  }
}

class DefultDecription extends StatelessWidget {
  DefultDecription({
    super.key,
    required this.textDecription,
  });
  String textDecription;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Text(
        textDecription,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(color: textColor, fontSize: 18.sp),
      ),
    );
  }
}
