import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/Presentation/FastLAugh/widgets/video_list_item.dart';
import 'package:netflix_ui/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix_ui/core/colors.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return Center(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
              ));
            } else if (state.isError) {
              return Center(child: Text('Error while getting Data'));
            } else if (state.videoList.isEmpty) {
              Center(child: Icon(Icons.videocam_off_rounded));
            }
            return PageView(
              scrollDirection: Axis.vertical,
              children: List.generate(
                  state.videoList.length,
                  (index) => VideoListInheritedWidget(
                        movieData: state.videoList[index],
                        widgets: VideoListItem(
                          key: Key(index.toString()),
                          index: index,
                        ),
                      )),
            );
          },
        ),
      ),
    );
  }
}
