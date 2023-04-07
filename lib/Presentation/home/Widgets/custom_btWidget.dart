import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class addButton extends StatelessWidget {
  const addButton({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
          color: kbuttonwhite,
        ),
        Text(
          title,
          style: TextStyle(color: kWhiteColor, fontSize: 15),
        )
      ],
    );
  }
}
