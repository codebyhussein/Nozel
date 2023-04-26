import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/views/auth/login_view.dart';
import 'package:hotel_app/views/homeScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Cubit/RegisterCubit/register_cubit.dart';
import '../../core/global.dart';
import '../../widgets/DefultButtom.dart';
import '../../widgets/DefultCirecleAvater.dart';
import '../../widgets/DefultTextFormField.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

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
                      style: TextStyle(color: Colors.white))));
              isloading = false;

              AppHelper.NavigateToNextScreens(context, SignUpScreen());
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
                          'Sign Up',
                          style: TextStyle(
                              color: textColor,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Please Registration with email and sign up \n to continue using our app',
                          style: TextStyle(fontSize: 16, color: textColor),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        DefultTextFormField(
                          text: 'Name',
                          iconDatapre: Icons.person,
                          keyboardType: TextInputType.text,
                          ispassword: false,
                          TextLabel: 'Name',
                          message: 'Please Enter your Name',
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                                        fontSize: 9,
                                        color: textColor,
                                      ),
                                    )
                                  : Text(
                                      'unshow',
                                      style: TextStyle(
                                        fontSize: 9,
                                        color: textColor,
                                      ),
                                    )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        DefultTextFormField(
                          text: 'Phone',
                          iconDatapre: Icons.phone,
                          keyboardType: TextInputType.number,
                          ispassword: false,
                          TextLabel: 'Phone',
                          message: 'Please Enter your Phone',
                          onChanged: (value) {
                            phone = value;
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                                    fontSize: 16.0, color: textColor)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(
                            'or',
                            style: TextStyle(
                              fontSize: 20,
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
                                    onPressed: () {},
                                  ),
                                  DefultCircleAvater(
                                    Image: 'images/twitter.png',
                                    onPressed: () {},
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
                                    "Already have an Account ?",
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
                                          context, LoginScreen());
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
