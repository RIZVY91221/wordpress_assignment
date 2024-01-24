import 'package:bs_assignment/core/controller/global_controller.dart';
import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController(repository: getIt<BaseRepository>()));
  }
}
