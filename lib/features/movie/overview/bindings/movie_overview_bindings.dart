import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/movie/overview/controller/movie_overview_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class MovieOverviewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieOverviewController>(() => MovieOverviewController(repository: getIt<BaseRepository>()));
  }
}
