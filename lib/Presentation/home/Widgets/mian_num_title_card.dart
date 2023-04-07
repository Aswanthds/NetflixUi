import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_title.dart';
import 'package:netflix_ui/Presentation/home/Widgets/num_card.dart';

class RowNumHome extends StatelessWidget {
  const RowNumHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: " Top 10 Tv Shoes in India Today"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: LimitedBox(
            maxHeight: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => NumberCard(
                    index: index + 1,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
