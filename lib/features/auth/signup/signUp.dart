import 'package:flutter/material.dart';
import 'package:hotel_app/features/auth/signup/signupBody.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignUpScreenBody(),
    );
  }
}
