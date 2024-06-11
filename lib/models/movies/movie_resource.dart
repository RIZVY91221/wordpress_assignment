import 'package:bs_assignment/models/movies/movie_item.dart';
import 'package:bs_assignment/models/movies/prettify_response.dart';

class MovieResource {
  Movies? movies;
  PrettifyMovie? prettifyMovies;

  MovieResource({this.movies, this.prettifyMovies});

  factory MovieResource.fromJson(Map<String, dynamic> json) => MovieResource(
        movies: Movies.fromJson(json),
        prettifyMovies: PrettifyMovie.fromJson(json),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'movies': movies,
        'prettifyMovies': prettifyMovies,
      };
}
