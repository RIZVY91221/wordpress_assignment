import 'package:bs_assignment/environment/environment.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final BaseRepository repository;

  GlobalController({required this.repository});

  @override
  void onInit() {
    super.onInit();
  }
}
