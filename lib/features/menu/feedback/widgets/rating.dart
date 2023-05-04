import 'package:flutter/material.dart';
import 'package:hotel_app/core/global.dart';
import 'package:hotel_app/core/style/colors.dart';

class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  Widget _buildStar(int index) {
    IconData iconData = Icons.star_border;
    Color color = textColor;
    if (_rating >= index) {
      iconData = Icons.star;
      color = Colors.orange;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = index;
        });
      },
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) => _buildStar(index + 1)),
    );
  }
}
