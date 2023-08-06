import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Defult_Carouse_lSlider extends StatefulWidget {
  List<dynamic> imgList;
  Defult_Carouse_lSlider({super.key, required this.imgList});

  @override
  State<Defult_Carouse_lSlider> createState() => _Defult_Carouse_lSliderState();
}

class _Defult_Carouse_lSliderState extends State<Defult_Carouse_lSlider> {
  final CarouselController _controller = CarouselController();
  List<String> RoomsName = [
    "Standard Room",
    "Deluxe Room",
    "Executive Suite",
    "Presidential Suite",
    "Family Suite",
    "Honeymoon Suite",
    "Penthouse Suite",
    "Junior Suite",
    "Ocean View Room",
    "Pool View Room",
  ];
  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map((item) => Container(
              height: 450.h,
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0.w),
                    ],
                  )),
            ))
        .toList();
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  var current = index;
                });
              }),
        ),
      ],
    );
  }
}
