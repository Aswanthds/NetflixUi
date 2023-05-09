import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/Presentation/FastLAugh/widgets/video_list_item.dart';
import 'package:netflix_ui/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix_ui/core/colors.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: List.generate(
                10,
                (index) => VideoListItem(
                      index: index,
                    )),
          ),
        ),
      ),
    );
  }
}
