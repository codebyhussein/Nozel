import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/features/menu/feedback/feedbackScreenBody.dart';
import 'package:hotel_app/features/menu/menuScreen.dart';
import '../../../core/global.dart';
import 'widgets/rating.dart';

import '../../../Cubit/HomeCubit/home_cubit.dart';
import '../../widgets/DefultButtom.dart';
import '../../widgets/DefultTextFormField.dart';

class FeedBackScreen extends StatelessWidget {
  FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: feedbackScreenBody());
  }
}
