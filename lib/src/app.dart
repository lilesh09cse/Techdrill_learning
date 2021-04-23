import 'package:flutter/material.dart';
import 'package:drill_app/src/bloc/bloc.movieData.dart';
import 'package:drill_app/src/ui/movie/movieList.dart';
import 'package:drill_app/src/ui/onBoard/splash.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
