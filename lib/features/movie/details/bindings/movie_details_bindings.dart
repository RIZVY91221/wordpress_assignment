import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/movie/details/controller/movie_details_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class MovieDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailsController>(() => MovieDetailsController(repository: getIt<BaseRepository>()));
  }
}
