import 'package:netflix_ui/Infrastructure/api_key.dart';
import 'package:netflix_ui/core/strings.dart';

class ApiEndPoints {
  static const downloads = "$kBaseurl/trending/movie/day?api_key=$apiKey";
  static const search = "$kBaseurl/search/movie?api_key=$apiKey";

  static const hotandnewtv = "$kBaseurl/discover/tv?api_key=$apiKey";
  static const hotandnewmovie = "$kBaseurl/discover/movie?api_key=$apiKey";
}
