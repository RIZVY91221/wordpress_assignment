import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/auth/signup/controller/signup_controller.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class SignupBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController(repository: getIt<BaseRepository>()));
  }
}
