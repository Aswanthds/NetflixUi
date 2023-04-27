import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_ui/Presentation/home/Widgets/bg_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_title.dart';
import 'package:netflix_ui/Presentation/home/Widgets/mian_num_title_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/num_card.dart';
import 'package:netflix_ui/Presentation/home/main_title_card.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

const imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg";

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;
              // print(direction);
              if (direction == ScrollDirection.reverse) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }
              return true;
            },
            child: SafeArea(
              child: Stack(
                children: [
                  ListView(
                    children: [
                      BackgroundCardWidget(),
                      const RowHome(divTitle: "Released in Past Years"),
                      kHeight,
                      const RowHome(divTitle: "Trending Now"),
                      kHeight,
                      const RowNumHome(),
                      kHeight,
                      const RowHome(divTitle: "Tense Dramas"),
                      kHeight,
                      const RowHome(divTitle: "South Indian Cinema"),
                      kHeight,
                    ],
                  ),
                  scrollNotifier.value == true
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 1200),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    'https://www.edigitalagency.com.au/wp-content/uploads/Netflix-N-Symbol-logo-red-transparent-RGB-png.png',
                                    height: 60,
                                    width: 60,
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Tv shows", style: constHometitle),
                                  Text("Movies", style: constHometitle),
                                  Text("Categories", style: constHometitle)
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
