import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class addButton extends StatelessWidget {
  const addButton({
    super.key,
    required this.title,
    required this.icon,
    required this.icoSize,
    required this.textSize,
  });

  final String title;
  final IconData icon;
  final double icoSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: icoSize,
          color: kbuttonwhite,
        ),
        Text(
          title,
          style: TextStyle(color: kWhiteColor, fontSize: textSize),
        )
      ],
    );
  }
}
