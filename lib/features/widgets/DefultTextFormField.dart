import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/colors.dart';

class DefultTextFormField extends StatelessWidget {
  DefultTextFormField({
    super.key,
    required this.text,
    required this.message,
    required this.onChanged,
    @required this.sufixpreesed,
    required this.ispassword,
    @required this.prefixIcon,
    @required this.TextLabel,
    @required this.keyboardType,
    @required this.ontap,
  });
  String? text;
  String? message;
  String? TextLabel;
  TextInputType? keyboardType;
  Function? ontap;

  IconData? prefixIcon;
  Function(String)? onChanged;
  IconButton? sufixpreesed;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      width: 343.w,
      decoration: BoxDecoration(
          color: textformfield, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        onTap: () {
          ontap;
        },
        textDirection: TextDirection.ltr,
        keyboardType: keyboardType,
        obscureText: ispassword,
        decoration: InputDecoration(
            labelText: TextLabel,
            labelStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffix: sufixpreesed,
            hintText: '$text',
            prefixIcon: Icon(
              prefixIcon,
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
    super.key,
    required this.text,
    required this.message,
    required this.controller,
    @required this.sufixpreesed,
    required this.ispassword,
    @required this.prefixIcon,
    @required this.TextLabel,
    @required this.keyboardType,
    @required this.ontap,
  });

  String? text;
  String? message;
  String? TextLabel;
  TextInputType? keyboardType;
  Function? ontap;

  IconData? prefixIcon;

  IconButton? sufixpreesed;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0.h,
      width: 343.w,
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
            labelStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            suffix: sufixpreesed,
            //  suffix:Icon(iconeye) ,
            //  suffixIcon: Icon(iconeye),
            hintText: '$text',
            prefixIcon: Icon(
              prefixIcon,
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
    super.key,
    required this.text,
    required this.message,
    required this.onChanged,
    @required this.sufix,
    required this.ispassword,
    @required this.prefixIcon,
    @required this.TextLabel,
    @required this.keyboardType,
    @required this.ontap,
  });
  String? text;
  String? message;
  String? TextLabel;
  TextInputType? keyboardType;
  Function? ontap;

  IconData? prefixIcon;
  Function(String)? onChanged;
  Icon? sufix;
  bool ispassword = false;
  String? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0.h,
      width: 330.w,
      decoration: BoxDecoration(
          color: textformfield, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        onTap: () {
          ontap;
        },
        textDirection: TextDirection.ltr,
        keyboardType: keyboardType,
        obscureText: ispassword,
        decoration: InputDecoration(
            labelText: TextLabel,
            labelStyle: const TextStyle(color: Colors.white),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            //suffix: sufix,
            suffixIcon: sufix,
            hintText: '$text',
            prefixIcon: Icon(
              prefixIcon,
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
