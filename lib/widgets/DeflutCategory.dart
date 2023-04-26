import 'package:flutter/material.dart';

import '../core/global.dart';
import 'DefultButtom.dart';

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
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Image.asset(image),
              SizedBox(
                width: 40,
              ),
              Column(
                children: [
                  Container(
                    width: 170,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: SizedBox(
                      width: 140,
                      child: DafultButtom(
                        text: textinButtom,
                        ontap: ontap,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 115),
          child: Divider(
            height: 1,
            endIndent: 0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
