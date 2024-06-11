import 'package:bs_assignment/models/movies/movie_item.dart';

class PrettifyMovie {
  final int id;
  final String name;
  final String language;
  final String title;
  final String overview;
  final dynamic popularity;
  final String image;
  final String backDropImage;

  PrettifyMovie(
      {this.id = 0,
      this.name = '',
      this.language = '',
      this.title = '',
      this.overview = '',
      this.popularity,
      this.image = '',
      this.backDropImage = ''});

  factory PrettifyMovie.fromJson(Map<String, dynamic> json) {
    Movies movie = Movies.fromJson(json);
    return PrettifyMovie(
      id: movie.id ?? 0,
      name: movie.originalTitle ?? ' - ',
      language: movie.originalLanguage ?? ' - ',
      title: movie.title ?? ' - ',
      overview: movie.overview ?? ' - ',
      popularity: movie.popularity ?? 0,
      image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      backDropImage: 'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
    );
  }
}
