import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/style/colors.dart';
import 'package:hotel_app/features/widgets/foodbody.dart';
import '../../../Cubit/HomeCubit/home_cubit.dart';

import '../../../core/getAllImageService.dart';
import '../../../core/global.dart';
import '../../widgets/DefultButtom.dart';
import '../../Services/categoryScreen.dart';
import '../../widgets/DefultTextFormField.dart';

class FoodScreen extends StatefulWidget {
  FoodScreen(
      {super.key, required this.NameOfCategory, required this.nameOfOrder});
  String NameOfCategory;
  String nameOfOrder;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  String? search;

  List<Map<String, dynamic>> fooditems = [
    {
      "name": "Chicken Alfredo Pasta",
      'url': 'images/food1.png',
      "price": 15.99,
      "date": "2023-05-9",
      "count_available": 10
    },
    {
      "name": "Grilled Salmon",
      'url': 'images/food2.png',
      "price": 21.99,
      "date": "2023-5-7",
      "count_available": 7
    },
    {
      "name": "Margherita Pizza",
      'url': 'images/food3.png',
      "price": 12.99,
      "date": "2023-05-6",
      "count_available": 12
    },
    {
      "name": "Caesar Salad",
      'url': 'images/food4.png',
      "price": 8.99,
      "date": "2023-04-",
      "count_available": 15
    },
    {
      "name": "Grilled",
      'url': 'images/food5.png',
      "price": 21.99,
      "date": "2023-05-5",
      "count_available": 7
    },
    {
      "name": "Margherita Pizza",
      'url': 'images/food1.png',
      "price": 12.99,
      "date": "2023-05-20",
      "count_available": 12
    },
    {
      "name": "Grilled Salmon",
      'url': 'images/food2.png',
      "price": 21.99,
      "date": "2023-04-30",
      "count_available": 7
    },
  ];

  List<Map<String, dynamic>> FoundItems = [];
  @override
  void initState() {
    FoundItems = fooditems;
    super.initState();
  }

  void filter(String enteredKeyword) {
    List<Map<String, dynamic>>? result = [];
    if (enteredKeyword.isEmpty) {
      result = fooditems;
    } else {
      result = fooditems
          .where((Element) => Element["name"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      FoundItems = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/signIn.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoryScreenServices()),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        widget.NameOfCategory,
                        style: TextStyle(
                            fontSize: 30,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DefultTextFormFieldSearch(
                      text: 'Search',
                      iconDatapre: Icons.search,
                      keyboardType: TextInputType.text,
                      ispassword: false,
                      TextLabel: 'search',
                      message: 'Please Search now',
                      onChanged: (value) {
                        filter(value);
                      },
                      sufix: const Icon(
                        Icons.mic,
                        color: Colors.white,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 550,
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return FoodBody(
                              image: FoundItems[index]['url'],
                              count: FoundItems[index]['count_available'],
                              date: FoundItems[index]['date'],
                              price: FoundItems[index]['price'],
                              nameofFood: FoundItems[index]['name']);
                        },
                        separatorBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 60),
                            child: Divider(
                              height: 1,
                              endIndent: 0,
                              color: Colors.white,
                            ),
                          );
                        },
                        itemCount: FoundItems.length),
                  )
                ],
              ),
            ],
          )),
    ));
  }
}
