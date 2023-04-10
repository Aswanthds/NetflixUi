import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/New_AND_HOT/Widgets/comin_soon_widget.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';

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
                  indicator: BoxDecoration(
                      borderRadius: kRadius30, color: kWhiteColor),
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
          body: TabBarView(children: [
            _buildComingSoon(context),
            _buildEveryonesWatching()
          ])),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryonesWatching() {
    return SizedBox();
  }
}

