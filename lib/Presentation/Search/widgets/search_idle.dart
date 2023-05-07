import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/Presentation/Search/widgets/search_text.dart';
import 'package:netflix_ui/application/search/searchresult_bloc.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/strings.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchText(title: "Top Searches"),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchresultBloc, SearchresultState>(
            builder: (context, state) {
              if (state.isError) {
                return Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline),
                    Text(
                      "Error !!! ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ));
              } else if (state.idleList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     CircularProgressIndicator(strokeWidth: 2),
                      Text(
                        "List is Empty",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              } else
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final movie = state.idleList[index];
                    return TopSearchTile(
                      image: '$imageAppendUrl${movie.backdropPath}',
                      title: movie.title ?? "No title",
                    );
                  },
                  //String get posterImageUrl => '$imageAppendUrl$posterPath';
                  separatorBuilder: (ctx, index) => kHeight20,
                  itemCount: state.idleList.length,
                );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchTile extends StatelessWidget {
  final String title;
  final String image;
  const TopSearchTile({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: sizeWidth * 0.35,
          height: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              title,
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
        const SizedBox(width: 5),
        const CircleAvatar(
          radius: 25,
          backgroundColor: kbuttonwhite,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: kbuttonBlack,
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
