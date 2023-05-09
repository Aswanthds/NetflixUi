import 'package:netflix_ui/Infrastructure/api_key.dart';
import 'package:netflix_ui/core/strings.dart';

class ApiEndPoints {
  static const downloads = "$kBaseurl/trending/movie/day?api_key=$apiKey";
  static const search = "$kBaseurl/search/movie?api_key=$apiKey";

  /* Hot and New  API */
  static const hotandnewtv =
      "$kBaseurl/discover/tv?api_key=$apiKey&language=en-US&with_original_language=hi|ml";
  static const hotandnewmovie = "$kBaseurl/discover/movie?api_key=$apiKey&sort_by=popularity.desc";

  /* Home Screen API */
  
  static const trending = "$kBaseurl/trending/movie/day?api_key=$apiKey";
  static const southIndian =
      "$kBaseurl/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&with_original_language=ml|ta|te|kn";
  static const pastYears =
      "$kBaseurl/discover/movie?api_key=$apiKey&primary_release_date.gte=2022-01-01&sort_by=popularity.desc&primary_release_date.lte=2022-12-31";

  static const top10shows =
      "$kBaseurl/discover/tv?api_key=$apiKey&language=en-US&with_original_language=ml";

  static const tenseDramas = "$kBaseurl/discover/movie?api_key=$apiKey&with_genres=28,53,18";

  
}
