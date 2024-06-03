import 'package:bs_assignment/core/base/base_controller.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/uttils/toasts.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends BaseController {
  final BaseRepository repository;

  SignUpController({required this.repository});

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void signUp() async {
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      if (passwordController.text == confirmPasswordController.text) {
        Map<String, dynamic> data = {
          "username": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text
        };
        await callDataService(repository.postSignup(data), onSuccess: (v) {
          AppToasts.defaultBanner(msg: v["message"], backgroundColor: AppColor.primaryToneOneEAF4FF);
          Get.back();
        });
      } else {
        AppToasts.error(msg: "Password not matched");
      }
    } else {
      AppToasts.error(msg: "Field are missing");
    }
  }
}
