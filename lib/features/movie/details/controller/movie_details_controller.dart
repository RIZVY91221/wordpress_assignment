import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/models/movies/movie_resource.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MovieDetailsController extends BaseController {
  final BaseRepository repository;

  MovieDetailsController({required this.repository});

  var arg = Get.arguments;
  var movieResource = MovieResource().obs;
  var movieId = 0.obs;

  @override
  void onInit() {
    movieId.value = arg['id'] as int;
    debugPrint("${movieId.value}");
    super.onInit();
  }

  /* call data from repo
  * **/
  Future<void> getMovieDetailsService() async {
    await callDataService(repository.getMovieDetails(movieId.value), onSuccess: (value) => movieResource.value = value);
  }
}
