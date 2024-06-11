import 'package:bs_assignment/datasource/local_data_source/base_local_source.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/datasource/shared_preference_data_source/base_shared_prefrence.dart';
import 'package:bs_assignment/models/movies/movie_item.dart';
import 'package:bs_assignment/models/movies/movie_resource.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRepository implements BaseRepository {
  // api objects
  final BaseRemoteDataSource _remoteDataSource;

  final BaseLocalDataSource _localDataSource;

  final BaseSharedPreference _sharedPreference;

  // constructor
  ImplementBaseRepository(this._remoteDataSource, this._localDataSource, this._sharedPreference);

  @override
  Future initBoxes(List<String> boxes) {
    return _localDataSource.initBoxes(boxes);
  }

  @override
  String get accessToken => _localDataSource.accessToken;

  @override
  Future<void> setAccessToken(String accessToken) {
    return _localDataSource.setAccessToken(accessToken);
  }

  @override
  Future<void> logout() {
    return _localDataSource.logout();
  }

  @override
  Future<List<MovieResource>> getMovieList(int page) {
    return _remoteDataSource.getMovieList(page);
  }

  @override
  Future<MovieResource> getMovieDetails(int id) {
    return _remoteDataSource.getMovieDetails(id);
  }
}
