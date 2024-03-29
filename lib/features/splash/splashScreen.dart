import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/features/home/homeScreen.dart';

import '../../core/global.dart';
import '../../core/style/colors.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> SlideingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    gotoHomeScreen();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300.h,
              child: Stack(
                children: [
                  AppLogo(
                    hight: 300.h,
                  ),
                  Positioned(
                    bottom: 10.h,
                    left: 70.w,
                    child: SlideTransition(
                      position: SlideingAnimation,
                      child: Text(
                        'Welcome In The Nozel Hotel',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  gotoHomeScreen() {
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ));
  }

  initSlidingAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    SlideingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(_animationController);
    _animationController.forward();

    SlideingAnimation.addListener(() {
      setState(() {});
    });
  }
}
