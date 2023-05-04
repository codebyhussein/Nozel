import 'package:flutter/material.dart';

import 'package:hotel_app/features/menu/cleaning/cleaningScreenBody.dart';

class CleaningScreen extends StatelessWidget {
  const CleaningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: cleaningScreenBody());
  }
}
