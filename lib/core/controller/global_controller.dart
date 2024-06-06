import 'package:bs_assignment/repository/base_repository.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final BaseRepository repository;

  GlobalController({required this.repository});

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> logOut() async {
    await repository.logout().whenComplete(() => Get.offAllNamed(AppRoutes.LOGIN_SCREEN));
  }
}
