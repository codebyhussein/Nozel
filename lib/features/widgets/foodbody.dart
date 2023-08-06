import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/Cubit/HomeCubit/home_cubit.dart';
import 'package:hotel_app/features/widgets/DefultButtom.dart';

import '../../core/style/colors.dart';

class FoodBody extends StatelessWidget {
  FoodBody(
      {super.key,
      required this.image,
      required this.count,
      required this.date,
      required this.price,
      required this.nameofFood});

  String image;
  String date;
  double price;
  int count;
  String nameofFood;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100.h,
          child: Row(
            children: [
              Image.asset(image),
              SizedBox(
                width: 35.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameofFood,
                    style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        count.toString(),
                        style: const TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                        child: Text(
                          '.',
                          style: TextStyle(color: textColor, fontSize: 15.sp),
                        ),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'PLN $price',
                        style: TextStyle(color: Colors.red, fontSize: 12.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            date,
                            style: TextStyle(color: textColor, fontSize: 10.sp),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.white,
                            child: Text(
                              '.',
                              style:
                                  TextStyle(color: textColor, fontSize: 15.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Completed',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10.w,
          top: 20.h,
          child: SizedBox(
            width: 75.w,
            height: 40.h,
            child: DafultButtom(
              text: 'Buy',
              ontap: () async {
                await BlocProvider.of<HomeCubit>(context).OrderMethod(
                    nameOfOrder: nameofFood, count: count, price: price);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    '''
"Thank you Your delicious meal is currently being
prepared and is still cooking. We kindly ask
for your patience and understanding as we make
sure it's cooked to perfection. Rest assured 
that we'll let you know as soon as it's ready.
Thank you for your cooperation and
we hope you enjoy your meal!"
"Watting..."
                  ''',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 3),
                ));
              },
            ),
          ),
        )
      ],
    );
  }
}
