import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 31, fontWeight: FontWeight.w900),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color: kWhiteColor,
            size: 30,
          ),
          kWidth,
          Container(
            width: 20,
            height: 20,
            color: Colors.blue,
          ),
          kWidth
        ],
      ),
    );
  }
}
