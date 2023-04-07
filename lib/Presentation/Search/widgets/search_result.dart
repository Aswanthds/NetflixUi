import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/Search/widgets/search_text.dart';
import 'package:netflix_ui/core/constants.dart';

const image =
    'http://www.themoviedb.org/t/p/w600_and_h900_bestv2/4hqtjslVCaDVgblg7iCtGIy7exO.jpg';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchText(title: "Movies & TV"),
        kHeight,
        Expanded(
          child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children: List.generate(21, (index) {
                return const MainCard();
              })),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
