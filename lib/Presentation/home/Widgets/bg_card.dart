import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          // color: Colors.blue,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kImageHome), fit: BoxFit.fill)),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const addButton(
                  icon: Icons.add,
                  title: 'My List',
                  icoSize: 20,
                  textSize: 16,
                ),
                _homeWidget(),
                const addButton(
                  icon: Icons.info_outline,
                  title: 'Info',
                  icoSize: 20,
                  textSize: 16,
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _homeWidget() {
    return TextButton.icon(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kWhiteColor)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kbuttonBlack,
        ),
        label: const Text(
          "Play",
          style: TextStyle(
              fontSize: 18, color: kbuttonBlack, fontWeight: FontWeight.bold),
        ));
  }
}
