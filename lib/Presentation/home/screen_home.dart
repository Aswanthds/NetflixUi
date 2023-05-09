import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/Presentation/home/Widgets/bg_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/main_title.dart';
import 'package:netflix_ui/Presentation/home/Widgets/mian_num_title_card.dart';
import 'package:netflix_ui/Presentation/home/Widgets/num_card.dart';
import 'package:netflix_ui/Presentation/home/main_title_card.dart';
import 'package:netflix_ui/application/Home/home_bloc.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/strings.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

const imageUrl =
    "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg";

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(GetHomeScreenData());
    });
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
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.isError) {
                        return Center(child: Text('Error while getting Data'));
                      }

                      final _releasePastYear = state.pastYearMovieList.map((e) {
                        return "$imageAppendUrl${e.posterPath}";
                      }).toList();
                      // _releasePastYear.shuffle();

                      final _trendingMovieList =
                          state.trendingMovieList.map((e) {
                        return "$imageAppendUrl${e.posterPath}";
                      }).toList();
                      //_trendingMovieList.shuffle();

                      final _tensed = state.tenseDramaMovieList.map((e) {
                        return "$imageAppendUrl${e.posterPath}";
                      }).toList();
                      //_tensed.shuffle();

                      final _topshows = state.trendingTvList.map((e) {
                        return "$imageAppendUrl${e.posterPath}";
                      }).toList();
                      //_top10.shuffle();

                      final _southIndian = state.southIndianMovieList.map((e) {
                        return "$imageAppendUrl${e.posterPath}";
                      }).toList();
                      //_southIndian.shuffle();

                      return ListView(
                        children: [
                          BackgroundCardWidget(),
                          RowHome(
                            divTitle: "Released in Past Years",
                            posterList: _releasePastYear.sublist(0, 10),
                          ),
                          kHeight,
                          RowHome(
                            divTitle: "Trending Now",
                            posterList: _trendingMovieList.sublist(0, 10),
                          ),
                          kHeight,
                          RowNumHome(
                            posterList: _topshows.sublist(0, 10),
                          ),
                          kHeight,
                          RowHome(
                            divTitle: "Tense Dramas",
                            posterList: _tensed.sublist(0, 10),
                          ),
                          kHeight,
                          RowHome(
                            divTitle: "South Indian Cinema",
                            posterList: _southIndian.sublist(0, 10),
                          ),
                          kHeight,
                        ],
                      );
                    },
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
