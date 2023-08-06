import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/colors.dart';
import '../booking/userBooked.dart';
import '../widgets/DefultButtom.dart';
import '../home/homeScreen.dart';

class roomScreen extends StatelessWidget {
  roomScreen({
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
            physics: const BouncingScrollPhysics(),
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
                      padding: EdgeInsets.only(left: 20.w),
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
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          Text(
                            NameOfCategory,
                            style: TextStyle(
                                fontFamily: 'Nova Oval',
                                fontSize: 22.sp,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(CategoryPage)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      CategoryDescription,
                      style: TextStyle(color: textColor, fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Maximum Occupancy',
                              style:
                                  TextStyle(color: textColor, fontSize: 16.sp),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: textColor,
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  NumberOfHuman,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 18.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Column(
                          children: [
                            Text(
                              'Minimum Stay',
                              style:
                                  TextStyle(color: textColor, fontSize: 18.sp),
                            ),
                            Row(
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16.sp),
                                ),
                                SizedBox(
                                  width: 1.w,
                                ),
                                Text(
                                  ' Night(s)',
                                  style: TextStyle(
                                      color: textColor, fontSize: 16.sp),
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
                          padding: EdgeInsets.only(left: 222.w),
                          child: Text(
                            'Price for 1 Night(s)',
                            style:
                                TextStyle(color: Colors.red, fontSize: 10.sp),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.circle,
                              color: textColor,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'One night',
                              style:
                                  TextStyle(color: textColor, fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 120.w,
                            ),
                            Text(
                              '\$$oneNightPrice',
                              style:
                                  TextStyle(color: textColor, fontSize: 18.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.data_exploration_rounded,
                              color: textColor,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'More than 1 day',
                              style:
                                  TextStyle(color: textColor, fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 70.w,
                            ),
                            Text(
                              '\$$More_than_oneNightPrice',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              '\$$More_than_oneNightPriceChange',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 18.sp),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.data_exploration_rounded,
                              color: textColor,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              'One week',
                              style:
                                  TextStyle(color: textColor, fontSize: 18.sp),
                            ),
                            SizedBox(
                              width: 120.w,
                            ),
                            Text(
                              '\$$one_week_price',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              '\$$one_week_priceChange',
                              style: TextStyle(
                                  color: Colors.green, fontSize: 18.sp),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DafultButtom(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserBooked()),
                        );
                      },
                      text: 'Book Now',
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
