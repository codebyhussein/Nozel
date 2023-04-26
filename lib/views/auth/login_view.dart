import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/Services/Facebook_Auth.dart';
import 'package:hotel_app/Services/Google_Auth.dart';
import 'package:hotel_app/views/auth/signUp.dart';

import '../../core/global.dart';
import '../../widgets/DefultButtom.dart';
import '../../widgets/DefultCirecleAvater.dart';
import '../../widgets/DefultTextFormField.dart';
import '../homeScreen.dart';
import '../../Cubit/LoginCubit/login_cubit.dart';

import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Cubit/LoginCubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  bool isloading = false;

  String? email, password;
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
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              isloading = true;
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.errorMassege,
                      style: const TextStyle(color: Colors.white))));
              isloading = true;
              AppHelper.NavigateToNextScreens(context, LoginScreen());
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
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Sign In',
                            style: TextStyle(
                                fontSize: 30,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 100,
                          ),
                          DefultTextFormField(
                            text: 'Email',
                            iconDatapre: Icons.email,
                            keyboardType: TextInputType.emailAddress,
                            ispassword: false,
                            TextLabel: 'Email',
                            message: 'Please Enter your Email',
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DefultTextFormField(
                            text: 'Password',
                            iconDatapre: Icons.lock,
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
                                    ? const Text(
                                        'Show',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffBDBDBD),
                                        ),
                                      )
                                    : const Text(
                                        'unshow',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffBDBDBD),
                                        ),
                                      )),
                          ),
                          const SizedBox(
                            height: 160,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Forgot your password?',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff1DA1F2),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(
                            child: Text(
                              'or',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xffBDBDBD),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: textColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        AppHelper.NavigateToNextScreens(
                                            context, SignUpScreen());
                                      },
                                      child: const Text(
                                        'Sign up',
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
              ),
            );
          },
        ),
      ),
    ));
  }
}
