import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/features/Services/Facebook_Auth.dart';
import 'package:hotel_app/features/Services/Google_Auth.dart';
import 'package:hotel_app/features/auth/login/login_view.dart';
import 'package:hotel_app/features/home/homeScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../Cubit/RegisterCubit/register_cubit.dart';
import '../../../core/global.dart';
import '../../../core/style/colors.dart';
import '../../widgets/DefultButtom.dart';
import '../../widgets/DefultCirecleAvater.dart';
import '../../widgets/DefultTextFormField.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final _formKey = GlobalKey<FormState>();

  bool isloading = false;

  String? email, password, name;
  String? phone;

  bool isChecked = false;
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/signIn.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppBadding),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              isloading = true;
            } else if (state is RegisterSuccess) {
              isloading = false;

              AppHelper.NavigateToNextScreens(context, const HomeScreen());

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Welcome in the Nozel hotel',
                      style: TextStyle(color: Colors.white))));
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMassege,
                      style: const TextStyle(color: Colors.white))));
              isloading = false;

              AppHelper.NavigateToNextScreens(
                  context, const SignUpScreenBody());
            } else if (state is RegisterChange) {
              ispassword = !ispassword;
            } else if (state is RegisterPolicy) {
              isChecked = !isChecked;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isloading,
              child: Form(
                key: _formKey,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Please Registration with email and sign up \n to continue using our app',
                          style: TextStyle(fontSize: 16.sp, color: textColor),
                        ),
                        SizedBox(
                          height: 25.0.h,
                        ),
                        DefultTextFormField(
                          text: 'Name',
                          prefixIcon: Icons.person,
                          keyboardType: TextInputType.text,
                          ispassword: false,
                          TextLabel: 'Name',
                          message: 'Please Enter your Name',
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DefultTextFormField(
                          text: 'Email',
                          prefixIcon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          ispassword: false,
                          TextLabel: 'Email',
                          message: 'Please Enter your Email',
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DefultTextFormField(
                          text: 'Password',
                          prefixIcon: Icons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          ispassword: ispassword,
                          TextLabel: 'Password',
                          message: 'Please Enter your Password',
                          onChanged: (value) {
                            password = value;
                          },
                          sufixpreesed: IconButton(
                              onPressed: () async {
                                await BlocProvider.of<RegisterCubit>(context)
                                    .change(value: ispassword);
                              },
                              icon: ispassword
                                  ? Text(
                                      'Show',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: textColor,
                                      ),
                                    )
                                  : Text(
                                      'unshow',
                                      style: TextStyle(
                                        fontSize: 9.sp,
                                        color: textColor,
                                      ),
                                    )),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        DefultTextFormField(
                          text: 'Phone',
                          prefixIcon: Icons.phone,
                          keyboardType: TextInputType.number,
                          ispassword: false,
                          TextLabel: 'Phone',
                          message: 'Please Enter your Phone',
                          onChanged: (value) {
                            phone = value;
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            Checkbox(
                                checkColor: Colors.black,
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                value: isChecked,
                                onChanged: (bool? value) async {
                                  await BlocProvider.of<RegisterCubit>(context)
                                      .changePolicy(value: value!);
                                }),
                            //don't forget cirlce check
                            Text('I read and agree to Terms and Conditions',
                                style: TextStyle(
                                    fontSize: 14.0.sp, color: textColor)),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        DafultButtom(
                          ontap: () async {
                            if (_formKey.currentState!.validate()) {
                              await BlocProvider.of<RegisterCubit>(context)
                                  .signUpUser(
                                name: name!,
                                email: email!,
                                password: password!,
                                phone: phone!,
                              );

                              AppHelper.NavigateToNextScreens(
                                  context, const HomeScreen());
                            }
                          },
                          text: 'Sign Up',
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Center(
                          child: Text(
                            'or',
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: textColor,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DefultCircleAvater(
                                    Image: 'images/google.png',
                                    onPressed: () async {
                                      await GoogleAuthService
                                          .SigninWithGoogle();
                                      AppHelper.NavigateToNextScreens(
                                          context, const HomeScreen());
                                    },
                                  ),
                                  DefultCircleAvater(
                                    Image: 'images/facebook.png',
                                    onPressed: () async {
                                      await FacebookAuthService
                                          .signInWithFacebook();
                                      AppHelper.NavigateToNextScreens(
                                          context, const HomeScreen());
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an Account ?",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      color: textColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0.w,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      AppHelper.NavigateToNextScreens(
                                          context, const LoginScreen());
                                    },
                                    child: const Text(
                                      'Sign-in',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff1DA1F2),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
