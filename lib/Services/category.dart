import 'package:flutter/material.dart';
import 'package:hotel_app/views/menu_view/menu.dart';
import '../widgets/DefultTextFormField.dart';

import '../core/global.dart';
import '../widgets/DeflutCategory.dart';
import '../widgets/DefultButtom.dart';
import '../views/homeScreen.dart';
import '../views/menu_view/Cleaning.dart';
import '../views/menu_view/foodScreen.dart';

class CategoryScreenServices extends StatelessWidget {
  const CategoryScreenServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: mainColor,
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/homePage.png"),
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
                                  builder: (context) => const MenuScreen()),
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
                        'Categories',
                        style: TextStyle(
                            fontSize: 30,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  DeflutCategory(
                    image: "images/Breakfast.png",
                    text: "Breakfast",
                    textinButtom: "Check",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodScreen(
                                  NameOfCategory: 'Breakfast',
                                  nameOfOrder: 'Pizzeria La Granta',
                                )),
                      );
                    },
                  ),
                  DeflutCategory(
                    image: "images/Dinner.png",
                    text: "Dinner",
                    textinButtom: "Check",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodScreen(
                                  NameOfCategory: 'Dinner',
                                  nameOfOrder: 'Pizzeria La Granta',
                                )),
                      );
                    },
                  ),
                  DeflutCategory(
                    image: "images/Dessert.png",
                    text: "Dessert",
                    textinButtom: "Check",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodScreen(
                                  NameOfCategory: 'Dessert',
                                  nameOfOrder: 'Pizzeria La Granta',
                                )),
                      );
                    },
                  ),
                  DeflutCategory(
                    image: "images/Lunch.png",
                    text: "Lunch",
                    textinButtom: "Check",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FoodScreen(
                                  NameOfCategory: 'Lunch',
                                  nameOfOrder: 'Pizzeria La Granta',
                                )),
                      );
                    },
                  ),
                  DeflutCategory(
                    image: "images/Lunch.png",
                    text: "service",
                    textinButtom: "Check",
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CleaningScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          )),
    ));
  }
}
