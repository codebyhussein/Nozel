import 'package:flutter/material.dart';

import 'package:get/get_core/get_core.dart';

import '../core/global.dart';
import 'homeScreen.dart';
import '../widgets/stackView.dart';
import 'userBooked.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../widgets/DefultButtom.dart';

class RoomsScreen extends StatelessWidget {
  RoomsScreen({
    super.key,
    required this.NameOfCategory,
    required this.CategoryPage,
    required this.CategoryDescription,
    required this.More_than_oneNightPrice,
    required this.More_than_oneNightPriceChange,
    required this.NumberOfHuman,
    required this.oneNightPrice,
    required this.one_week_price,
    required this.one_week_priceChange,
  });
  String NameOfCategory;
  String CategoryPage;
  String CategoryDescription;
  String NumberOfHuman;
  String oneNightPrice;
  String More_than_oneNightPriceChange;
  String More_than_oneNightPrice;
  String one_week_price;
  String one_week_priceChange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/booking.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppBadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Text(
                              '$NameOfCategory',
                              style: TextStyle(
                                  fontFamily: 'Nova Oval',
                                  fontSize: 22,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(CategoryPage)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        CategoryDescription,
                        style: TextStyle(color: textColor, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Maximum Occupancy',
                                style:
                                    TextStyle(color: textColor, fontSize: 18),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: textColor,
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    NumberOfHuman,
                                    style: const TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Text(
                                'Minimum Stay',
                                style:
                                    TextStyle(color: textColor, fontSize: 18),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    ' Night(s)',
                                    style: TextStyle(
                                        color: textColor, fontSize: 18),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 222),
                            child: Row(
                              children: [
                                const Text(
                                  'Price for 1 Night(s)',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.circle,
                                color: textColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'One night',
                                style:
                                    TextStyle(color: textColor, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Text(
                                '\$$oneNightPrice',
                                style:
                                    TextStyle(color: textColor, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.data_exploration_rounded,
                                color: textColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'More than 1 day',
                                style:
                                    TextStyle(color: textColor, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 70,
                              ),
                              Text(
                                '\$$More_than_oneNightPrice',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '\$$More_than_oneNightPriceChange',
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.data_exploration_rounded,
                                color: textColor,
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'One week',
                                style:
                                    TextStyle(color: textColor, fontSize: 18),
                              ),
                              const SizedBox(
                                width: 120,
                              ),
                              Text(
                                '\$$one_week_price',
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.red,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '\$$one_week_priceChange',
                                style: const TextStyle(
                                    color: Colors.green, fontSize: 18),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DafultButtom(
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserBooked()),
                          );
                        },
                        text: 'Book Now',
                      )
                    ],
                  ),
                ),
              ],
            )));
  }
}
