import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/homeScreenBody.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: homeScreenBody());
  }
}
