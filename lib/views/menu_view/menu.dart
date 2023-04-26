import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:hotel_app/core/getAllImageService.dart';

import '../../core/global.dart';
import '../../widgets/DefultIRowInMenuScreen.dart';
import 'FeedBack.dart';
import 'Two_bedroom_suites.dart';
import 'deluxe_studios.dart';

import 'Suites.dart';
import 'Cleaning.dart';
import '../../Services/category.dart';

import '../RoomsScreen.dart';
import '../homeScreen.dart';

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
                      NameOfPage: HomeScreen(),
                      text: 'Home',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      NameOfPage: DeluxeStudios(),
                      text: 'Deluxe Studios',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      NameOfPage: Suites(),
                      text: 'Suites',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      NameOfPage: Two_bedroom_suites(),
                      text: 'Two bedroom Suite',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      NameOfPage: FeedBack(),
                      text: 'Feedback',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
                      NameOfPage: CategoryScreenServices(),
                      text: 'Food services',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DfultItemInMenu(
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
