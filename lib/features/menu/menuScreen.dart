import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hotel_app/core/getAllImageService.dart';

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
                    AppLogo(hight: 250),
                    DfultItemInMenu(
                      icondata: IconlyBold.home,
                      NameOfPage: HomeScreen(),
                      text: 'Home',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      icondata: IconlyBold.plus,
                      NameOfPage: DeluxeStudios(),
                      text: 'Deluxe Studios',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      icondata: IconlyBold.plus,
                      NameOfPage: Suites(),
                      text: 'Suites',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      icondata: IconlyBold.plus,
                      NameOfPage: Two_bedroom_suites(),
                      text: 'Two bedroom Suite',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      icondata: Icons.people,
                      NameOfPage: FeedBackScreen(),
                      text: 'Feedback',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      icondata: Icons.food_bank,
                      NameOfPage: CategoryScreenServices(),
                      text: 'Food services',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      icondata: Icons.cleaning_services,
                      NameOfPage: CleaningScreen(),
                      text: 'Cleaning service',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ))));
  }
}
