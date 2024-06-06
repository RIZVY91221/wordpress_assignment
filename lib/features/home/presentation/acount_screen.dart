import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/controller/global_controller.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/features/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends BaseView<HomeController> {
  AccountScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          BaseTextInput(
            hintText: "Enter Email",
            labelText: "Email",
            keyboardType: TextInputType.text,
            controller: controller.emailController,
          ),
          BaseTextInput(
            hintText: "Enter FullName",
            labelText: "Full Name",
            keyboardType: TextInputType.text,
            controller: controller.fullNameController,
          ),
          AppGap.vertical20,
          DefaultPrimaryButton(
            text: "Submit",
            onPressed: () => controller.updateUser(),
          ),
          AppGap.vertical20,
          StandardSecondaryButton(
            text: "Logout",
            onPressed: () async => await Get.find<GlobalController>().logOut(),
            buttonSize: ButtonSize.half,
            height: 50,
          )
        ],
      ),
    );
  }

  @override
  Color pageBackgroundColor() {
    return AppColor.scaffoldColor;
  }
}
