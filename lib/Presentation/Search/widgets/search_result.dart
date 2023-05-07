import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/Presentation/Search/widgets/search_text.dart';
import 'package:netflix_ui/application/search/searchresult_bloc.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/strings.dart';

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
          child: BlocBuilder<SearchresultBloc, SearchresultState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 8,
                childAspectRatio: 1 / 1.4,
                children: List.generate(
                  state.searchResultList.length,
                  (index) {
                    final movie = state.searchResultList[index];
                    return MainCard(
                        image: '$imageAppendUrl${movie.posterPath}');
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String image;
  const MainCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
