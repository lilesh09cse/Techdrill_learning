import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drill_app/src/resources/api/config.dart';
import 'package:flutter/material.dart';
import 'package:drill_app/src/bloc/bloc.movieData.dart';
import 'package:drill_app/src/model/model.movieData.dart';
import 'package:drill_app/src/ui/movie/movieDetail.dart';
import 'package:drill_app/src/utils/utils.constants.dart';
import 'package:drill_app/src/widgtes/domino.reveal.dart';

class MovieList extends StatefulWidget {
  final AllMovieBloc allMovieBloc;
  const MovieList({Key key, @required this.allMovieBloc}) : super(key: key);
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  ScrollController _controller;

  int _pageNo;

  @override
  void initState() {
    _pageNo = 1;
    widget.allMovieBloc.getMovieList(_pageNo);
    _controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      widget.allMovieBloc.getMovieList(++_pageNo);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.allMovieBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
          stream: widget.allMovieBloc.allMovieStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Results>> snapshot) {
            if (snapshot.hasData) {
              return ScrollConfiguration(
                behavior: ScrollBehavior(),
                child: GlowingOverscrollIndicator(
                  axisDirection: AxisDirection.down,
                  color: Colors.white,
                  child: ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      controller: _controller,
                      itemCount: snapshot.data.length + 1,
                      itemBuilder: (context, index) {
                        return index >= snapshot.data.length
                            ? customProgressIndicator()
                            : Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 24),
                                child: DominoReveal(
                                    child: _movieCard(snapshot.data, index)),
                              );
                      }),
                ),
              );
            } else {
              return customProgressIndicator();
            }
          }),
    );
  }

  Widget _movieCard(List<Results> _movieList, int index) {
    Results movieItem = _movieList[index];
    return Container(
      height: Constants.screenSize(context).height * 0.2,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoviedetailPage(
                      movie: _movieList[index], relatedList: _movieList)));
        },
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: _backgroundCard(
                    _movieList[index].backdropPath, _movieList[index].id)),
            _gradient(),
            Positioned(bottom: 0, right: 0, child: _basicDetail(movieItem))
          ],
        ),
      ),
    );
  }

  Widget _backgroundCard(String url, int id) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      width: Constants.screenSize(context).width * 0.9,
      height: Constants.screenSize(context).height * 0.2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: id,
          child: CachedNetworkImage(
            width: Constants.screenSize(context).width * 0.28,
            height: Constants.screenSize(context).height * 0.2,
            placeholder: (context, url) => Container(color: Colors.grey[900]),
            imageUrl: ApiConfig().imageUrl + url,
            fit: BoxFit.cover,
            fadeInCurve: Curves.easeIn,
            fadeInDuration: Duration(microseconds: 1000),
          ),
        ),
      ),
    );
  }

  Widget _basicDetail(Results movie) {
    return Container(
        width: Constants.screenSize(context).width * 0.9,
        height: Constants.screenSize(context).height * 0.2,
        child: Padding(
          padding: EdgeInsets.only(left: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _title(movie.originalTitle),
              SizedBox(height: 14),
              _popularity(movie.popularity.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _yearAndGenre(movie.releaseDate),
                  _voteCount(movie.voteAverage),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Text(
        title.toUpperCase(),
        maxLines: 2,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: IMPACT,
        ),
      ),
    );
  }

  Widget _yearAndGenre(String year) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Text(year,
          style: TextStyle(fontFamily: MONTSERRAT, color: Colors.white)),
    );
  }

  Widget _popularity(String popularity) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Popularity: ',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: MONTSERRAT,
                color: Colors.white),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(popularity.trim(),
                style: TextStyle(fontFamily: MONTSERRAT, color: Colors.white)),
          ))
        ],
      ),
    );
  }

  Widget _voteCount(double voteCount) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
      ),
      child: Text(voteCount.toString(),
          style: TextStyle(
              fontFamily: MONTSERRAT,
              color: Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.bold)),
    );
  }

  int _random(int min, int max) {
    Random random = new Random();
    return (min + random.nextInt(max - min));
  }

  Widget _gradient() {
    return Container(
      width: Constants.screenSize(context).width * 0.9,
      height: Constants.screenSize(context).height * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.black87, Colors.transparent],
              stops: [0.1, 1.0])),
    );
  }
}
