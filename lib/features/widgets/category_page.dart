import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/HomeCubit/home_cubit.dart';
import '../../core/getAllImageService.dart';
import '../../core/global.dart';
import '../../core/style/colors.dart';
import 'stackView.dart';

class categoryScreen extends StatelessWidget {
  categoryScreen({
    super.key,
    required this.CategoryFolder,
    required this.CategoryText,
  });
  String CategoryText;

  String CategoryFolder;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
              child: Icon(
            Icons.arrow_circle_down_outlined,
            color: textColor,
            size: 50,
          )),
          Center(
            child: Text(
              CategoryText,
              style: TextStyle(
                  color: textColor, fontFamily: 'Nova Oval', fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 510,
            child: FutureBuilder(
              future:
                  getImagesFromFirebaseStorage(NameofFolder: CategoryFolder),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('error happend'));
                } else if (snapshot.hasData) {
                  final List ListUrl = snapshot.data!;

                  return ListView.builder(
                      itemExtent: 330,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return StackView(
                          oneNightPrice: BlocProvider.of<HomeCubit>(context)
                                  .hotelroomdescriptionSuites[index]
                              ['oneNightPrice'],
                          one_week_price: BlocProvider.of<HomeCubit>(context)
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
                          NumberOfHuman: BlocProvider.of<HomeCubit>(context)
                                  .hotelroomdescriptionSuites[index]
                              ['NumberOfHuman'],
                          CategoryText: CategoryText,
                          CategorydescriptionText:
                              BlocProvider.of<HomeCubit>(context)
                                      .hotelroomdescriptionSuites[index]
                                  ['description'],
                          cateogryPage: ListUrl[index],
                          index: ListUrl[index],
                        );
                      },
                      itemCount: ListUrl.length);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      )
    ]);
  }
}
