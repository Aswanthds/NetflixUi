import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_title.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class RowHome extends StatelessWidget {
  const RowHome({
    super.key,
    required this.divTitle,
  });
  final String divTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(title: divTitle),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LimitedBox(
              maxHeight: 200,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) => MainCardHome(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
