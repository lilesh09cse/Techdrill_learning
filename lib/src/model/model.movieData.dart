class MovieDataModel {
  int page;
  List<Results> results;
  int totalPages;
  int totalResults;

  MovieDataModel({this.page, this.results, this.totalPages, this.totalResults});

  MovieDataModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class Results {
  String overview;
  String releaseDate;
  bool adult;
  String backdropPath;
  int voteCount;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  bool video;
  double voteAverage;
  double popularity;
  String mediaType;

  Results(
      {this.overview,
      this.releaseDate,
      this.adult,
      this.backdropPath,
      this.voteCount,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.posterPath,
      this.title,
      this.video,
      this.voteAverage,
      this.popularity,
      this.mediaType});

  Results.fromJson(Map<String, dynamic> json) {
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
