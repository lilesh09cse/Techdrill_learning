import 'package:flutter/material.dart';
import 'package:drill_app/src/bloc/bloc.movieData.dart';

class AllMovieScreenBlocProvider extends InheritedWidget {
  final AllMovieBloc bloc;


  AllMovieScreenBlocProvider({Key key, Widget child})
      : bloc = AllMovieBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AllMovieBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType
            as AllMovieScreenBlocProvider)
        .bloc;
  }
}
