import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_ui/Presentation/New_AND_HOT/Widgets/comin_soon_widget.dart';
import 'package:netflix_ui/Presentation/New_AND_HOT/Widgets/everyoneswatching_widget.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/application/HotandNewBloc/hot_and_new_bloc.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:netflix_ui/core/strings.dart';

class ScreenNewandHot extends StatelessWidget {
  const ScreenNewandHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            actions: [
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
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: kWhiteColor,
                labelColor: kbuttonBlack,
                labelStyle:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                indicator:
                    BoxDecoration(borderRadius: kRadius30, color: kWhiteColor),
                tabs: const [
                  Tab(
                    text: "🍿 Coming Soon",
                  ),
                  Tab(
                    text: " 👀 Everyone's Watching",
                  )
                ]),
          ),
        ),
        body: TabBarView(
          children: [
            ComingSoonList(key: Key('coming_soon')),
            EvryOnesWatchingList(
              key: Key('Everyones_watching'),
            )
          ],
        ),
      ),
    );
  }
}

// Widget _buildComingSoon(BuildContext context) {
//   return ListView.builder(
//     itemCount: 10,
//     itemBuilder: (context, index) => const ComingSoonWidget(),
//   );
// }

// Widget _buildEveryonesWatching() {
//   return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (BuildContext context, int index) => SizedBox()
//       //EveryonesiwatchingWidget(descp: '', movieName: '', posterPath: '',),
//       );
// }

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataCmingSoon());
      },
    );

    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context).add(const LoadDataCmingSoon());
      },
      child:
          BlocBuilder<HotAndNewBloc, HotAndNewState>(builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Text(
              "Loading Data",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        } else if (state.isError) {
          return Center(
            child: Text(
              "Error has Occured ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        } else if (state.comingSoonList.isEmpty) {
          return Center(
            child: Text(
              "Nothing !!! is Coming Soon ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }
        return ListView.builder(
            padding: EdgeInsets.only(top: 20),
            itemCount: state.comingSoonList.length,
            itemBuilder: (context, index) {
              final movie = state.comingSoonList[index];
              if (movie.id == null) {
                return const SizedBox();
              }

              log(movie.releaseDate.toString());

              String month = '';
              String date = '';

              try {
                final _date = DateTime.tryParse(movie.releaseDate!);
                final formateddate = DateFormat.yMMMMd('en_US').format(_date!);

                log(formateddate.toString());
                month =
                    formateddate.split(" ").first.substring(0, 3).toUpperCase();
                date = movie.releaseDate!.split('-')[1];
              } catch (e) {
                month = '';
                date = '';
              }

              return ComingSoonWidget(
                day: date, //movie.releaseDate!.split('-')[1],
                descp: movie.overview ?? "No Description ",
                id: movie.id.toString(),
                month:
                    month, //formateddate.split(" ").first.substring(0, 3).toUpperCase(),
                movieName: movie.originalTitle ?? "No title",
                posterPath: "$imageAppendUrl${movie.backdropPath}",
              );
            });
      }),
    );
  }
}

/* Everyones Wacthing List  */

class EvryOnesWatchingList extends StatelessWidget {
  const EvryOnesWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataEvryOneWaching());
      },
    );

    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataEvryOneWaching());
      },
      child:
          BlocBuilder<HotAndNewBloc, HotAndNewState>(builder: (context, state) {
        if (state.isLoading) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(strokeWidth: 2),
                Text(
                  "Loading Data",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        } else if (state.isError) {
          return Center(child: Text('Error while getting Data'));
        } else if (state.everyOneIsWatchingList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(strokeWidth: 2),
                Text(
                  "Nothing !!! is Coming Soon ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        } else {
          return ListView.builder(
              padding: EdgeInsets.all(20),
              itemCount: state.everyOneIsWatchingList.length,
              itemBuilder: (context, index) {
                final tv = state.everyOneIsWatchingList[index];
                if (tv.id == null) {
                  return const SizedBox();
                }

                return EveryonesiwatchingWidget(
                  posterPath: "$imageAppendUrl${tv.backdropPath}",
                  movieName: tv.originalName ?? "No title",
                  descp: tv.overview ?? "No Description ",
                );
              });
        }
      }),
    );
  }
}
