import 'package:flutter/material.dart';

class DefultCircleAvater extends StatelessWidget {
  DefultCircleAvater({super.key, required this.Image, required this.onPressed});
  String Image;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed;
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(Image),
        backgroundColor: Colors.transparent,
        radius: 25.0,
      ),
    );
  }
}
