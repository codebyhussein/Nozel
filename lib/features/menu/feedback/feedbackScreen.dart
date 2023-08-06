import 'package:flutter/material.dart';

import 'package:hotel_app/features/menu/feedback/feedbackScreenBody.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: feedbackScreenBody());
  }
}
