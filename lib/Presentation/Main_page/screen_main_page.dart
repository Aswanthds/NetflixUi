import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/Downloads/widgets/screen_downloads.dart';
import 'package:netflix_ui/Presentation/FastLAugh/fastlaugh.dart';
import 'package:netflix_ui/Presentation/Main_page/Widgets/bottom_nav.dart';
import 'package:netflix_ui/Presentation/New_AND_HOT/ne_and_hot.dart';
import 'package:netflix_ui/Presentation/Search/screen_search.dart';
import 'package:netflix_ui/Presentation/home/Screen_home.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewandHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexchangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottonNavigationWidget(),
    );
  }
}
