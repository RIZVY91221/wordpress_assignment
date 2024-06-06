import 'dart:async';

import 'package:bs_assignment/datasource/local_data_source/constants/hive_constants.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final BaseRepository repository;

  SplashController({required this.repository});

  @override
  void onInit() async {
    await repository.initBoxes(HiveConstants.INIT_BOXS);
    Timer(const Duration(milliseconds: 400), () async {
      if (repository.accessToken.isNotEmpty) {
        //Todo: need to add route here.....
        Get.offAllNamed(AppRoutes.HOME_SCREEN);
      } else {
        Get.offAllNamed(AppRoutes.LOGIN_SCREEN);
      }
    });
    super.onInit();
  }
}
