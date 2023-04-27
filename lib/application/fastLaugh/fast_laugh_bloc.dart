import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_ui/Domain/Downloads/Models/downloads.dart';
import 'package:netflix_ui/Domain/Downloads/i_downloads_repo.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dvideoUrls = [
  "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
];

// final dimgUrls  = [
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerJoyrides.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/Sintel.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/SubaruOutbackOnStreetAndDirt.jpg",
// 	"https://storage.googleapis.com/gtv-videos-bucket/sample/images/TearsOfSteel.jpg"
// ];

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadRepo _downloadServices,
  ) : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      emit(
        FastLaughState(
            videoList: [], isLoading: true, isError: false,  likedVideoIds: []),
      );
      //get trending movies
      final _result = await _downloadServices.getDownloadsImages();
      final _state = _result.fold(
        (l) => FastLaughState(
            videoList: [], isLoading: false, isError: true, likedVideoIds: state.likedVideoIds,  ),
        (resp) =>
            FastLaughState(
            videoList: [], isLoading: false, isError: true, likedVideoIds: [],),

      );
      //send toui

      emit(_state);
    });
  }
}
