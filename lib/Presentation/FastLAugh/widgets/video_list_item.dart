import 'package:flutter/material.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //left side
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12.withOpacity(0.5),
                  radius: 20,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volume_off),
                  ),
                ),
                //tightside
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'http://www.themoviedb.org/t/p/w600_and_h900_bestv2/zvGTZYDCoMSMIBkXExxRxLYimqN.jpg'),
                      ),
                    ),
                    VideoActionWidget(
                      icon: Icons.emoji_emotions,
                      title: "LOL",
                    ),
                    VideoActionWidget(
                      icon: Icons.add,
                      title: "My List",
                    ),
                    VideoActionWidget(
                      icon: Icons.ios_share,
                      title: "Share",
                    ),
                    VideoActionWidget(
                      icon: Icons.play_arrow,
                      title: "Play",
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}
