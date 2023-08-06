import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/style/colors.dart';
import 'package:hotel_app/features/widgets/category_page.dart';
import 'package:page_transition/page_transition.dart';

import '../Services/categoryScreen.dart';
import '../../core/global.dart';
import '../menu/menuScreen.dart';
import '../widgets/DefultDivider.dart';
import 'widgets/Slider.dart';

class homeScreenBody extends StatelessWidget {
  const homeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/homePage.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        AppLogo(hight: 270.h),
                        Positioned(
                          height: 50.h,
                          left: 10.w,
                          top: 39.h,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 25,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.leftToRight,
                                        child: const MenuScreen()));
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          top: 230.h,
                          left: 130.w,
                          // bottom: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.data_exploration_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              const Text(
                                '9.5',
                                style: TextStyle(color: Colors.red),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Icon(Icons.location_on_outlined,
                                  size: 20, color: textColor),
                              const Text(
                                '15 km',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SliderPage(),
                    DefultDecription(
                      textDecription:
                          'We offer 12 individually curated rooms (six deluxe studios, five suites, and one two bedroom suite) each uniquely designed with plush interiors, bohemian accents, and one-of-a-kind furnishings. Rooms feature custom art ',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DefultDivider(),
                    categoryScreen(
                      CategoryFolder: 'deluxe studios',
                      CategoryText: 'deluxe studios',
                    ),
                    DefultDecription(
                      textDecription:
                          'Everything you need, nothing you don’t. These stylish rooms for two people are designed to inspire and relax each interior is uniquely appointed queen ',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DefultDivider(),
                    categoryScreen(
                      CategoryFolder: 'Two bed room suites',
                      CategoryText: 'Two bed room suites',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DefultDecription(
                      textDecription:
                          'Our signature accommodation, and where our passion project started. This stylish and unique two-story home is an ideal space for families, groups of friends, and celebrations.',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DefultDivider(),
                    categoryScreen(
                      CategoryFolder: 'suites',
                      CategoryText: 'Suites',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    DefultDecription(
                      textDecription:
                          'Room to relax with plush interiors, bohemian accents, and serene open floorplans. Ideal for two - four people. each interior is uniquely appointed queen or king bed kitchen with stove, sink, ',
                    ),
                    DefultDivider(),
                    Container(
                      height: 350.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'images/hotelhome.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 40.h,
                            left: 50.w,
                            child: Center(
                              child: Container(
                                width: 250.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: MaterialButton(
                                  onPressed: () {
                                    AppHelper.NavigateToNextScreens(context,
                                        const CategoryScreenServices());
                                  },
                                  child: Center(
                                    child: Text(
                                      'our Services',
                                      style: TextStyle(
                                          color: textColor,
                                          fontFamily: 'Nova Oval',
                                          fontSize: 30.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ));
  }
}
