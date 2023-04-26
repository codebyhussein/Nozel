import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/global.dart';
import '../../Cubit/HomeCubit/home_cubit.dart';

import '../../core/getAllImageService.dart';
import '../homeScreen.dart';
import '../../widgets/stackView.dart';

class Suites extends StatelessWidget {
  const Suites({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            AppHelper.NavigateToNextScreens(
                                context, const HomeScreen());
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Suites',
                        style: TextStyle(
                            fontFamily: 'Nova Oval',
                            fontSize: 25,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 600,
                    child: FutureBuilder(
                      future:
                          getImagesFromFirebaseStorage(NameofFolder: 'suites'),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text('error happend'));
                        } else if (snapshot.hasData) {
                          final List ListUrl = snapshot.data!;
                          return ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (BuildContext context, int index) {
                                return StackView(
                                  oneNightPrice:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['oneNightPrice'],
                                  one_week_price:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['one week price'],
                                  one_week_priceChange:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['one week priceChange'],
                                  More_than_oneNightPrice:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['More than oneNightPrice'],
                                  More_than_oneNightPriceChange:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['More than oneNightPriceChange'],
                                  NumberOfHuman:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['NumberOfHuman'],
                                  CategoryText: 'suites',
                                  CategorydescriptionText:
                                      BlocProvider.of<HomeCubit>(context)
                                              .hotelroomdescriptionSuites[index]
                                          ['description'],
                                  cateogryPage: ListUrl[index],
                                  index: ListUrl[index],
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
