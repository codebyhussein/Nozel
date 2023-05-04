import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
