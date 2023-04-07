import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/FastLAugh/widgets/video_list_item.dart';
import 'package:netflix_ui/core/colors/colors.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              10,
              (index) => VideoListItem(
                index: index,
              ),
            ),
          ),
        ));
  }
}
