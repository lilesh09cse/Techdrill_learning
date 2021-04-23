import 'package:drill_app/src/model/model.movieData.dart';
import 'package:drill_app/src/resources/api/api.basehelper.dart';
import 'package:drill_app/src/resources/api/config.dart';

class Repository {
  ApiBaseHelper _helper = ApiBaseHelper();
  String _baseUrl;
  String apiKey;
  

  Repository() {
    _baseUrl = ApiConfig().baseUrl;
    apiKey = ApiConfig().apiKey;
  }

  Future<MovieDataModel> getMovieList(int pageNo) async {
    final response = await _helper
        .get('$_baseUrl/trending/movie/week?api_key=$apiKey&page=$pageNo');
    return MovieDataModel.fromJson(response);
  }
}
