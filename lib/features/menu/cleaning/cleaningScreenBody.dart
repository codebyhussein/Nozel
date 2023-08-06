import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Cubit/HomeCubit/home_cubit.dart';
import '../../widgets/DefultButtominHome.dart';
import '../menuScreen.dart';

class cleaningScreenBody extends StatelessWidget {
  const cleaningScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/logoClean.png',
                  height: 220.h,
                  width: double.infinity,
                ),
                Positioned(
                  left: 10.w,
                  top: 70.h,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/cleaning.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 10.h,
                    left: 100.w,
                    child: Text(
                      'Cleaning room',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: Text(
                'You can order unlimited cleaning service for free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            DefultButtomInHomePage(
              text: 'Order now',
              ontap: () async {
                await BlocProvider.of<HomeCubit>(context).OrderServicesMethod(
                    nameOfOrder: "I need cleaning room please",
                    NameOfCleaning: "Cleaning Room");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    '''
"Hello! Our housekeeping team is currently cleaning
your room. We appreciate your patience and
understanding while they work to make sure
your stay is as comfortable as possible.
Thank you for your cooperation."
"Watting..."
''',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 4),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
