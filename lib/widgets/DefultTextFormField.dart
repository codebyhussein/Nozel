import 'package:flutter/material.dart';

import '../core/global.dart';

class DefultTextFormField extends StatelessWidget {
  DefultTextFormField({
    required this.text,
    required this.message,
    required this.onChanged,
    @required this.sufixpreesed,
    required this.ispassword,
    @required this.iconDatapre,
    @required this.TextLabel,
    @required this.keyboardType,
    @required this.ontap,
  });
  String? text;
  String? message;
  String? TextLabel;
  TextInputType? keyboardType;
  Function? ontap;

  IconData? iconDatapre;
  Function(String)? onChanged;
  IconButton? sufixpreesed;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 343,
      decoration: BoxDecoration(
          color: textformfield, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        onTap: () {
          ontap;
        },
        textDirection: TextDirection.ltr,
        keyboardType: keyboardType,
        obscureText: ispassword,
        decoration: InputDecoration(
            labelText: TextLabel,
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffix: sufixpreesed != null ? sufixpreesed : null,
            hintText: '$text',
            prefixIcon: Icon(
              iconDatapre,
              color: Colors.white,
            )),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
      ),
    );
  }
}

class DataTextFormField extends StatelessWidget {
  DataTextFormField({
    required this.text,
    required this.message,
    required this.controller,
    @required this.sufixpreesed,
    required this.ispassword,
    @required this.iconDatapre,
    @required this.TextLabel,
    @required this.keyboardType,
    @required this.ontap,
  });

  String? text;
  String? message;
  String? TextLabel;
  TextInputType? keyboardType;
  Function? ontap;

  IconData? iconDatapre;

  IconButton? sufixpreesed;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 343,
      decoration: BoxDecoration(
          color: textformfield, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        onTap: () {
          ontap;
        },
        textDirection: TextDirection.ltr,
        keyboardType: keyboardType,
        obscureText: ispassword,
        decoration: InputDecoration(
            labelText: TextLabel,
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffix: sufixpreesed != null ? sufixpreesed : null,
            //  suffix:Icon(iconeye) ,
            //  suffixIcon: Icon(iconeye),
            hintText: '$text',
            prefixIcon: Icon(
              iconDatapre,
              color: Colors.white,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
      ),
    );
  }
}

class DefultTextFormFieldSearch extends StatelessWidget {
  DefultTextFormFieldSearch({
    required this.text,
    required this.message,
    required this.onChanged,
    @required this.sufix,
    required this.ispassword,
    @required this.iconDatapre,
    @required this.TextLabel,
    @required this.keyboardType,
    @required this.ontap,
  });
  String? text;
  String? message;
  String? TextLabel;
  TextInputType? keyboardType;
  Function? ontap;

  IconData? iconDatapre;
  Function(String)? onChanged;
  Icon? sufix;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 330,
      decoration: BoxDecoration(
          color: textformfield, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        onTap: () {
          ontap;
        },
        textDirection: TextDirection.ltr,
        keyboardType: keyboardType,
        obscureText: ispassword,
        decoration: InputDecoration(
            labelText: TextLabel,
            labelStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            //suffix: sufix,
            suffixIcon: sufix,
            hintText: '$text',
            prefixIcon: Icon(
              iconDatapre,
              color: Colors.white,
            )),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return message;
          }
          return null;
        },
      ),
    );
  }
}
