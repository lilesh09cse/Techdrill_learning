import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:drill_app/src/resources/api/config.dart';
import 'package:flutter/material.dart';
import 'package:drill_app/src/model/model.movieData.dart';
import 'package:drill_app/src/ui/movie/scrollView.dart';
import 'package:drill_app/src/utils/utils.constants.dart';

class MoviedetailPage extends StatefulWidget {
  final Results movie;
  final List<Results> relatedList;

  const MoviedetailPage({Key key, this.movie, this.relatedList})
      : super(key: key);

  @override
  _MoviedetailPageState createState() => _MoviedetailPageState();
}

class _MoviedetailPageState extends State<MoviedetailPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _willPopCallback() async {
    Navigator.of(context).pop(true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            _backgroundposter(widget.movie),
            _movieData(widget.movie),
          ],
        ),
      ),
    );
  }

  Widget _backgroundposter(Results movie) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Hero(
        tag: movie.id,
        child: Container(
            height: Constants.screenSize(context).height * 0.85,
            child: CachedNetworkImage(
                placeholder: (context, url) {
                  return Container(
                    color: Colors.grey[900],
                  );
                },
                imageUrl:
                    ApiConfig().imageUrl + movie.posterPath,
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget _movieData(Results movie) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
              0.2,
              0.48
            ],
                colors: [
              Colors.transparent,
              Colors.black
              //Color(0xff26262d)
            ])),
        width: Constants.screenSize(context).width,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.7),
                tmdbOriginals(),
                SizedBox(height: 4),
                _contentTitle(movie.title),
                SizedBox(height: 16),
                _specification(7276, movie.originalLanguage, movie.voteAverage),
                SizedBox(height: 16),
                _yearAndGenre(movie.releaseDate.toString(), "Action"),
                SizedBox(height: 10),
                divider(context),
                SizedBox(height: 10),
                _playButton(movie),
                SizedBox(height: 36),
                _contentDesc(movie.overview),
                _popularity(movie.popularity.toString()),
                _voteCount(movie.voteCount.toString()),
                SizedBox(height: 12),
                widget.relatedList != null ? _youMayAlsoLike() : Container(),
                widget.relatedList != null ? _relatedContent() : Container(),
                SizedBox(height: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text tmdbOriginals() {
    return Text(
      "TMDB Originals",
      style: TextStyle(
          fontFamily: MONTSERRAT,
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700),
    );
  }

  Widget _contentTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 26,
          letterSpacing: 2,
          fontFamily: IMPACT,
        ),
      ),
    );
  }

  Widget _specification(int duration, String lang, double tvr) {
    return Container(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _duration(duration),
          SizedBox(width: 8),
          _lang(lang),
          SizedBox(width: 8),
          movieRating(tvr),
          SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _yearAndGenre(String year, genre) {
    return Text('$year  ·  $genre',
        style: TextStyle(fontFamily: MONTSERRAT, color: Colors.white));
  }

  Widget _playButton(Results _movie) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(4)),
        height: 28,
        width: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 6),
            Text("Watch Now",
                style: TextStyle(
                    fontFamily: MONTSERRAT,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(width: 6),
          ],
        ),
      ),
    );
  }

  Widget _contentDesc(String description) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 4),
      child: Container(
        child: Text(
          description,
          textAlign: TextAlign.left,
          style: TextStyle(
              height: 1.4, fontFamily: MONTSERRAT, color: Colors.white),
        ),
      ),
    );
  }

  Widget _popularity(String popularity) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
        left: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Text(popularity,
                style: TextStyle(fontFamily: MONTSERRAT, color: Colors.white)),
          ))
        ],
      ),
    );
  }

  Widget _voteCount(String voteCount) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 16),
        child: Container(
          child: Row(
            children: <Widget>[
              Text('Vote Count:  ',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: MONTSERRAT,
                      color: Colors.white)),
              Text(voteCount,
                  style:
                      TextStyle(fontFamily: MONTSERRAT, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _youMayAlsoLike() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Text(
            "YOU MAY ALSO LIKE",
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: MONTSERRAT,
                color: Colors.white),
          ),
        ));
  }

  Widget _duration(int duration) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Text(
            formatDuration(duration),
            style: TextStyle(
                fontFamily: MONTSERRAT,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _lang(String language) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3), color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Center(
          child: Text(
            '$language',
            style: TextStyle(
                fontFamily: MONTSERRAT,
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _relatedContent() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8, top: 8),
      child: Container(
        height: 160,
        child: HomeMovieScrollRow(
            key: PageStorageKey(widget.movie.id), movies: widget.relatedList..shuffle()),
      ),
    );
  }
}
