import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

Color textColor = const Color(0xffFFFFFF);
Color descriptionColor = const Color(0xff808080);
Color AppBarColor = Color.fromARGB(255, 19, 20, 21);
Color insideButtomColor = const Color(0xff000000);
Color textformfield = const Color(0xff4C4D4F);
Color ButtomColor = const Color(0xffD6DBDF);
const double AppBadding = 20.0;
Color mainColor = Color(0xff100B20);

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
        style: TextStyle(color: textColor, fontSize: 18),
      ),
    );
  }
}
