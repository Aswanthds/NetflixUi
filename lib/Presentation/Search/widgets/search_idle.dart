import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/Search/widgets/search_text.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/colors/colors.dart';

const image =
    "https://www.themoviedb.org/t/p/w533_and_h300_bestv2/ovM06PdF3M8wvKb06i4sjW3xoww.jpg";

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchText(title:"Top Searches"),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) => const TopSearchTile(),
            separatorBuilder: (ctx, index) => kHeight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}



class TopSearchTile extends StatelessWidget {
  const TopSearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: sizeWidth * 0.35,
          height: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover)),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              'MovieName',
              style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
        ),
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
