import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/New_AND_HOT/Widgets/comin_soon_widget.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/core/colors.dart';
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
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) =>
          EveryonesiwatchingWidget(),
    );
  }
}

class EveryonesiwatchingWidget extends StatelessWidget {
  const EveryonesiwatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                        'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/iHSwvRVsRyxpX7FE7GbviaDvgGZ.jpg',
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black12.withOpacity(0.5),
                      radius: 15,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.volume_off),
                        iconSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Wednesday",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -4),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        addButton(
                          icon: Icons.telegram_rounded,
                          title: "My List",
                          icoSize: 30,
                          textSize: 12,
                        ),
                        kWidth,
                        addButton(
                          icon: Icons.add,
                          title: "My List",
                          icoSize: 30,
                          textSize: 12,
                        ),
                        kWidth,
                        addButton(
                          icon: Icons.play_arrow,
                          title: "Play",
                          icoSize: 30,
                          textSize: 12,
                        ),
                        kWidth,
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.edigitalagency.com.au/wp-content/uploads/Netflix-N-Symbol-logo-red-transparent-RGB-png.png"))),
                  ),
                  Text(
                    "Series",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 2),
                  )
                ],
              ),
              const Text(
                "Wednesday ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              kHeight,
              Text(
                "Wednesday Addams is sent to Nevermore Academy, a bizarre boarding school where she attempts to master her psychic powers, stop a monstrous killing spree of the town citizens, and solve the supernatural mystery that affected her family 25 years ago — all while navigating her new relationships.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight50,
            ],
          ),
        ],
      ),
    );
  }
}

// Text(
//           "AVATAR 2 ",
//           style: TextStyle(
//               fontSize: 35, fontWeight: FontWeight.bold, letterSpacing: -4),
//         ),
//         const Spacer(),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               addButton(
//                 icon: Icons.notifications,
//                 title: "Remind me",
//                 icoSize: 20,
//                 textSize: 12,
//               ),
//               kWidth,
//               addButton(
//                 icon: Icons.info_outline,
//                 title: "Info",
//                 icoSize: 20,
//                 textSize: 12,
//               ),
//             ],
//           ),
//         )
