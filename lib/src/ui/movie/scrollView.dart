import 'package:drill_app/src/resources/api/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:meta/meta.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:drill_app/src/model/model.movieData.dart';
import 'package:drill_app/src/ui/movie/movieDetail.dart';
import 'package:drill_app/src/utils/util.routes.dart';

class HomeMovieScrollRow extends StatefulWidget {
  final List<Results> movies;

  const HomeMovieScrollRow({@required Key key, @required this.movies})
      : super(key: key);

  @override
  _HomeMovieScrollRowState createState() => _HomeMovieScrollRowState();
}

class _HomeMovieScrollRowState extends State<HomeMovieScrollRow> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        key: widget.key,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          var movie = widget.movies[index];
          return Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: _ScrollItemView(movie: movie),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviedetailPage(
                            movie: widget.movies[index],
                            relatedList: widget.movies)));
              },
            ),
          );
        },
        padding: EdgeInsets.only(left: 8.0),
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
      ),
    );
  }
}

class _ScrollItemView extends StatelessWidget {
  final Results movie;

  const _ScrollItemView({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: 100,
        child: CachedNetworkImage(
            placeholder: (context, url) {
              return Container(
                color: Colors.grey[900],
              );
            },
            imageUrl: ApiConfig().imageUrl + movie.posterPath,
            fit: BoxFit.cover),
      ),
    );
  }
}
