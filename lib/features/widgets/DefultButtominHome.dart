import 'package:flutter/material.dart';

class DefultButtomInHomePage extends StatelessWidget {
  DefultButtomInHomePage({super.key, required this.ontap, required this.text});
  VoidCallback? ontap;
  String? text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 59.0,
          width: 192.0,
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
                    fontSize: 25.0,
                    fontFamily: 'Nova Oval'),
              ),
            ),
          )),
    );
  }
}
