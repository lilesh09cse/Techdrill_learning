import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:drill_app/src/bloc/bloc.movieData.dart';
import 'package:drill_app/src/ui/movie/movieList.dart';
import 'package:drill_app/src/utils/util.routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var navigateAfterSeconds = MovieList(allMovieBloc: AllMovieBloc());

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      if (navigateAfterSeconds is String) {
        Navigator.of(context)
            .pushReplacementNamed(navigateAfterSeconds.toString());
      } else if (navigateAfterSeconds is Widget) {
        Navigator.of(context).pushReplacement(
            createRoute(navigateAfterSeconds, PageTransitionType.slideInLeft));
      } else {
        throw new ArgumentError(
            'widget.navigateAfterSeconds must either be a String or Widget');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: _body()),
    );
  }

  Widget _body() {
    return Container(
      child: Image.asset('assets/icons/splash.png',
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8),
    );
  }
}
