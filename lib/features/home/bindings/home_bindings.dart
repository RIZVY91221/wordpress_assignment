import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/home/controller/home_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(repository: getIt<BaseRepository>()));
  }
}
