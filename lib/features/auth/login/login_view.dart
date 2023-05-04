import 'package:flutter/material.dart';
import 'package:hotel_app/features/auth/login/loginScreenBody.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: loginScreenBody());
  }
}
