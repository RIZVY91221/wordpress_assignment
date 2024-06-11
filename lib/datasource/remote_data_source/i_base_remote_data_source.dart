import 'package:bs_assignment/core/network/dio_client.dart';
import 'package:bs_assignment/core/network/rest_client.dart';
import 'package:bs_assignment/core/utils/endpoints/endpoints.dart';
import 'package:bs_assignment/datasource/remote_data_source/base_remote_data_source.dart';
import 'package:bs_assignment/models/movies/movie_item.dart';
import 'package:bs_assignment/models/movies/movie_resource.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ImplementBaseRemoteDataSource extends BaseRemoteDataSource {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ImplementBaseRemoteDataSource(this._dioClient, this._restClient);

  @override
  Future<List<MovieResource>> getMovieList(int page) async {
    try {
      final res = await _dioClient.get(Endpoints.POPULAR_MOVIE, queryParameters: {"page": page});

      return List<MovieResource>.from(res["results"].map((e) => MovieResource.fromJson(e)).toList());
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MovieResource> getMovieDetails(int id) async {
    try {
      final res = await _dioClient.get("${Endpoints.POPULAR_MOVIE_DETAILS}/$id");
      return MovieResource.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
