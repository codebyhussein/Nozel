import 'package:flutter/material.dart';
import 'package:hotel_app/features/booking/userBookedBody.dart';

class UserBooked extends StatelessWidget {
  const UserBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: userBookedBody());
  }
}
