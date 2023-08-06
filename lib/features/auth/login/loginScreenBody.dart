import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/features/auth/login/login_view.dart';
import 'package:hotel_app/features/auth/signup/signUp.dart';
import 'package:hotel_app/features/home/homeScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../Cubit/LoginCubit/login_cubit.dart';
import '../../../core/style/colors.dart';
import '../../Services/Facebook_Auth.dart';
import '../../Services/Google_Auth.dart';
import '../../../core/global.dart';
import '../../widgets/DefultButtom.dart';
import '../../widgets/DefultCirecleAvater.dart';
import '../../widgets/DefultTextFormField.dart';

class loginScreenBody extends StatelessWidget {
  loginScreenBody({super.key});

  final _formKey = GlobalKey<FormState>();

  bool isloading = false;

  String? email, password;
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              isloading = true;
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMassege,
                      style: const TextStyle(color: Colors.white))));
              isloading = true;
              AppHelper.NavigateToNextScreens(context, const LoginScreen());
            } else if (state is LoginSuccess) {
              AppHelper.NavigateToNextScreens(context, const HomeScreen());
              isloading = false;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Welcome in the Nozel hotel',
                      style: TextStyle(color: Colors.white))));
            } else if (state is LoginChange) {
              ispassword = !ispassword;
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isloading,
              child: Form(
                key: _formKey,
                child: Center(
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
                            'Sign In',
                            style: TextStyle(
                                fontSize: 30.sp,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 100.h,
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
                            keyboardType: TextInputType.emailAddress,
                            ispassword: ispassword,
                            TextLabel: 'Password',
                            message: 'Please Enter your Password',
                            onChanged: (value) {
                              password = value;
                            },
                            sufixpreesed: IconButton(
                                onPressed: () async {
                                  await BlocProvider.of<LoginCubit>(context)
                                      .change(ispassword: ispassword);
                                },
                                icon: ispassword
                                    ? Text(
                                        'Show',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: const Color(0xffBDBDBD),
                                        ),
                                      )
                                    : Text(
                                        'unshow',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          color: const Color(0xffBDBDBD),
                                        ),
                                      )),
                          ),
                          SizedBox(
                            height: 160.h,
                          ),
                          DafultButtom(
                            ontap: () async {
                              if (_formKey.currentState!.validate()) {
                                await BlocProvider.of<LoginCubit>(context)
                                    .loginUser(
                                        email: email!, password: password!);
                                AppHelper.NavigateToNextScreens(
                                    context, const HomeScreen());
                              }
                            },
                            text: 'Sign In',
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot your password?',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: const Color(0xff1DA1F2),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: const Color(0xffBDBDBD),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
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
                                      "Don't have an account?",
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
                                            context, SignUpScreen());
                                      },
                                      child: Text(
                                        'Sign up',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: const Color(0xff1DA1F2),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
