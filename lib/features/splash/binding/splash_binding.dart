import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/splash/controller/splash_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(repository: getIt<BaseRepository>()));
  }
}
