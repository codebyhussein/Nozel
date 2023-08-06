import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/features/widgets/DefultButtominHome.dart';
import 'package:page_transition/page_transition.dart';

import '../roomDetails/roomScreen.dart';

class StackView extends StatelessWidget {
  StackView({
    super.key,
    required this.index,
    required this.CategorydescriptionText,
    required this.CategoryText,
    required this.cateogryPage,
    required this.More_than_oneNightPrice,
    required this.More_than_oneNightPriceChange,
    required this.NumberOfHuman,
    required this.oneNightPrice,
    required this.one_week_price,
    required this.one_week_priceChange,
  });

  String CategoryText;
  String CategorydescriptionText;

  String index;
  String cateogryPage;
  String NumberOfHuman;
  String oneNightPrice;
  String More_than_oneNightPriceChange;
  String More_than_oneNightPrice;
  String one_week_price;
  String one_week_priceChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 320.h,
              width: 320.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  index,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              CategorydescriptionText,
              maxLines: 3,
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Center(
            child: DefultButtomInHomePage(
              ontap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.bottomToTop,
                        duration: const Duration(seconds: 1),
                        child: roomScreen(
                          NumberOfHuman: NumberOfHuman,
                          oneNightPrice: oneNightPrice,
                          More_than_oneNightPrice: More_than_oneNightPrice,
                          More_than_oneNightPriceChange:
                              More_than_oneNightPriceChange,
                          one_week_price: one_week_price,
                          one_week_priceChange: one_week_priceChange,
                          NameOfCategory: CategoryText,
                          CategoryPage: cateogryPage,
                          CategoryDescription: CategorydescriptionText,
                        ),
                        childCurrent: this));
              },
              text: 'Check price',
            ),
          ),
        ],
      ),
    );
  }
}
