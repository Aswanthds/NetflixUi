import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
            ),
            Container(
              width: 130,
              height: 200,
              //color: Colors.red,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ggFHVNu6YYI5L9pCfOacjizRGt.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: kRadius10,
              ),
            ),
            kWidth,
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeColor: kWhiteColor,
            strokeWidth: 5.0,
            child: Text(
              "$index",
              style: TextStyle(
                fontSize: 150,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                decorationColor: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}

//