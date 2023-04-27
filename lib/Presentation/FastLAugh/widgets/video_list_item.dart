import 'package:flutter/material.dart';
import 'package:netflix_ui/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/Domain/Downloads/Models/downloads.dart';
import 'package:netflix_ui/core/strings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';
import 'dart:developer';

class VideoListInheritedWidget extends InheritedWidget {
  final Widget widgets;
  final Downloads movieData;

  const VideoListInheritedWidget(
      {Key? key, required this.movieData, required this.widgets})
      : super(child: widgets);

  @override
  bool updateShouldNotify(covariant VideoListInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListInheritedWidget>();
  }
}

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
     final posterpath =
         VideoListInheritedWidget.of(context)?.movieData.posterPath;

    final videoUrl = dvideoUrls[index % dvideoUrls.length];
    //final imgoUrl = dimgUrls [index % dimgUrls.length];
    
    return Stack(
      children: [
        //left side
        FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (bool) {}),
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
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage('$imageAppendUrl$posterpath'),
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
                   GestureDetector(
                    onTap:() {
                      final movieName = VideoListInheritedWidget.of(context)?.movieData.title;

                      log(movieName.toString());
                      if (movieName != null) {
                        Share.share('$imageAppendUrl$posterpath');
                      }
        
                    },
                      child: 
                      VideoActionWidget(
                        icon: Icons.ios_share,
                        title: "Share",
                      ),
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

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanged;
  FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanged});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerontoller;

  @override
  void initState() {
    _videoPlayerontoller = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerontoller.initialize().then((value) {
      setState(() {});
      _videoPlayerontoller.play();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: _videoPlayerontoller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerontoller.value.aspectRatio,
              child: VideoPlayer(_videoPlayerontoller))
          : Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }
  @override
  void dispose() {
    _videoPlayerontoller.dispose();
    super.dispose();
  }
}
