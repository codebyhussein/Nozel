import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/global.dart';
import '../../core/style/colors.dart';
import '../widgets/DefultIRowInMenuScreen.dart';
import 'feedback/feedbackScreen.dart';
import 'two_bedroom_suites/Two_bedroom_suites.dart';
import '../home/homeScreen.dart';
import 'delexStdio.dart/deluxe_studios.dart';

import 'suits/Suites.dart';
import 'cleaning/cleaningScreen.dart';
import '../Services/categoryScreen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: mainColor,
            ),
            child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppLogo(hight: 250.h),
                    DfultItemInMenu(
                      icondata: IconlyBold.home,
                      NameOfPage: const HomeScreen(),
                      text: 'Home',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DfultItemInMenu(
                      icondata: IconlyBold.plus,
                      NameOfPage: const DeluxeStudios(),
                      text: 'Deluxe Studios',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DfultItemInMenu(
                      icondata: IconlyBold.plus,
                      NameOfPage: const Suites(),
                      text: 'Suites',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DfultItemInMenu(
                      icondata: IconlyBold.plus,
                      NameOfPage: const Two_bedroom_suites(),
                      text: 'Two bedroom Suite',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DfultItemInMenu(
                      icondata: Icons.people,
                      NameOfPage: FeedBackScreen(),
                      text: 'Feedback',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DfultItemInMenu(
                      icondata: Icons.food_bank,
                      NameOfPage: const CategoryScreenServices(),
                      text: 'Food services',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DfultItemInMenu(
                      icondata: Icons.cleaning_services,
                      NameOfPage: const CleaningScreen(),
                      text: 'Cleaning service',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ))));
  }
}
