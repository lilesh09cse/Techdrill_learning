import 'dart:async';
import 'package:drill_app/src/bloc/bloc.base.dart';
import 'package:drill_app/src/model/model.movieData.dart';
import 'package:drill_app/src/resources/repository.dart';
import 'package:drill_app/src/utils/utils.constants.dart';

class AllMovieBloc implements BlocBase {
  final _repository = Repository();

  final _movieList = <Results>[];

  final StreamController<List<Results>> _suggestionController =
      StreamController<List<Results>>();

  Stream<List<Results>> get allMovieStream => _suggestionController.stream;

  getMovieList(int pageNo) async {
    try {
      MovieDataModel allMovieListResponse =
          await _repository.getMovieList(pageNo);
      _movieList.addAll(allMovieListResponse.results);
      _suggestionController.sink.add(_movieList);
    } catch (e) {
      Constants.showToast(e.toString());
    }
  }


  dispose() {
    _suggestionController.close();
  }
}
