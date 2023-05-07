import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/screen_home.dart';
import 'package:netflix_ui/core/constants.dart';

class MainCardHome extends StatelessWidget {
  final String imgUrl;
  const MainCardHome({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          height: 250,
          //color: Colors.red,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: kRadius10,
          ),
        ),
        kWidth,
      ],
    );
  }
}
