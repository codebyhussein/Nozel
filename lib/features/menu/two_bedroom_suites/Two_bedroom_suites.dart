import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/style/colors.dart';
import 'package:hotel_app/features/menu/menuScreen.dart';

import '../../../Cubit/HomeCubit/home_cubit.dart';

import '../../../core/getAllImageService.dart';
import '../../../core/global.dart';

import '../../widgets/stackView.dart';

class Two_bedroom_suites extends StatelessWidget {
  const Two_bedroom_suites({super.key});

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            AppHelper.NavigateToNextScreens(
                                context, const MenuScreen());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 30.w,
                      ),
                      Text(
                        'Two bed room suites',
                        style: TextStyle(
                            fontFamily: 'Nova Oval',
                            fontSize: 25.sp,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 550.h,
                    child: FutureBuilder(
                      future: getImagesFromFirebaseStorage(
                          NameofFolder: 'Two bed room suites'),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text('error happend'));
                        } else if (snapshot.hasData) {
                          final List ListUrl = snapshot.data!;
                          return ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return Stack(
                                  children: [
                                    StackView(
                                      oneNightPrice: BlocProvider.of<HomeCubit>(
                                                  context)
                                              .hotelroomdescriptionSuites[index]
                                          ['oneNightPrice'],
                                      one_week_price:
                                          BlocProvider.of<HomeCubit>(context)
                                                  .hotelroomdescriptionSuites[
                                              index]['one week price'],
                                      one_week_priceChange:
                                          BlocProvider.of<HomeCubit>(context)
                                                  .hotelroomdescriptionSuites[
                                              index]['one week priceChange'],
                                      More_than_oneNightPrice:
                                          BlocProvider.of<HomeCubit>(context)
                                                  .hotelroomdescriptionSuites[
                                              index]['More than oneNightPrice'],
                                      More_than_oneNightPriceChange: BlocProvider
                                                  .of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['More than oneNightPriceChange'],
                                      NumberOfHuman: BlocProvider.of<HomeCubit>(
                                                  context)
                                              .hotelroomdescriptionSuites[index]
                                          ['NumberOfHuman'],
                                      CategoryText: 'Two bed room suites',
                                      CategorydescriptionText:
                                          BlocProvider.of<HomeCubit>(context)
                                                  .hotelroomdescriptionSuites[
                                              index]['description'],
                                      cateogryPage: ListUrl[index],
                                      index: ListUrl[index],
                                    )
                                  ],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(),
                              itemCount: ListUrl.length);
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            )));
  }
}
