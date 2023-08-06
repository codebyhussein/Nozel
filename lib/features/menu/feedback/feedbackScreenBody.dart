import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/features/menu/feedback/widgets/rating.dart';

import '../../../Cubit/HomeCubit/home_cubit.dart';
import '../../../core/style/colors.dart';
import '../../widgets/DefultButtom.dart';
import '../../widgets/DefultTextFormField.dart';
import '../../home/homeScreen.dart';
import '../menuScreen.dart';

class feedbackScreenBody extends StatelessWidget {
  feedbackScreenBody({super.key});
  String? name;
  String? FeedBackText;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeLoading) {
              } else if (state is HomeSuccess) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content: Text(
                      '''
Thank you again for choosing our platform,
and for considering sharing your feedback,
with us. We truly appreciate it.''',
                      style: TextStyle(color: Colors.white),
                    )));
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MenuScreen()),
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              'FeedBack',
                              style: TextStyle(
                                  fontSize: 30.sp,
                                  color: textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Text(
                          'How satisfied are you with a booking process? ',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RatingWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'How satisfied are you with the usability of the App? ',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RatingWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'How satisfied are you with the online payment process? ',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        RatingWidget(),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'If you have any other feedback please tell us here. We love to improve our service?',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        DefultTextFormField(
                          text: 'Name',
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.text,
                          ispassword: false,
                          TextLabel: 'Enter your Name',
                          message: 'Please Enter your Name',
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 110.0.h,
                          width: 343.w,
                          decoration: BoxDecoration(
                              color: textformfield,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextField(
                            style: TextStyle(color: textColor),
                            textAlign: TextAlign.start,
                            minLines: null,
                            maxLines: null,
                            expands: true,
                            textDirection: TextDirection.ltr,
                            keyboardType: TextInputType.multiline,
                            obscureText: false,
                            decoration: InputDecoration(
                                labelText: 'Enter your feedback',
                                labelStyle: TextStyle(color: textColor),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                hintText: 'feedback',
                                prefixIcon: Icon(
                                  Icons.feed,
                                  color: textColor,
                                )),
                            onChanged: (value) {
                              FeedBackText = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DafultButtom(
                          text: 'Confirm',
                          ontap: () {
                            BlocProvider.of<HomeCubit>(context).FeedBackMethod(
                                name: name!, FeedBackText: FeedBackText!);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          },
                        )
                      ]),
                ],
              );
            },
          ),
        ));
  }
}
