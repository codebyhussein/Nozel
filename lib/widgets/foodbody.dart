import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/Cubit/HomeCubit/home_cubit.dart';
import 'package:hotel_app/core/global.dart';
import 'package:hotel_app/widgets/DefultButtom.dart';

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
        Container(
          height: 100,
          child: Row(
            children: [
              Image.asset(image),
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                width: 25,
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
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        count.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3,
                        child: Text(
                          '.',
                          style: TextStyle(color: textColor, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        'PLN ' + price.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            date,
                            style: TextStyle(color: textColor, fontSize: 10),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CircleAvatar(
                            radius: 4,
                            backgroundColor: Colors.white,
                            child: Text(
                              '.',
                              style: TextStyle(color: textColor, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Completed',
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 20,
          child: SizedBox(
            width: 75,
            height: 40,
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
                  duration: Duration(seconds: 4),
                ));
              },
            ),
          ),
        )
      ],
    );
    ;
  }
}
