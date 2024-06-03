import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/auth/signin/controller/login_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(repository: getIt<BaseRepository>()));
  }
}
