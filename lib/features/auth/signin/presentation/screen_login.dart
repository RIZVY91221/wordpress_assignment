import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/app_string.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/features/auth/signin/controller/login_controller.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseView<LoginController> {
  LoginScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColor.scaffoldColor;
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppPadding.p30),
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          /// Headlines
          Image.asset(
            Assets.iconsDokanLogo,
            width: Get.width / 2,
          ),

          AppGap.vertical10,

          /// Subtitle
          subTitle(),

          /// Error text message
          Obx(() => Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p10,
                  left: AppPadding.p20,
                  right: AppPadding.p20,
                ),
                child: Text(
                  controller.errorMsg.value,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: controller.errorMessageColor ?? AppColor.errorFE6C44),
                  textAlign: TextAlign.center,
                ),
              )),

          AppGap.vertical40,

          /// Email text
          Obx(
            () => BaseTextInput(
              hintText: AppString.email,
              elevation: 5,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String? val) => controller.inputTextTypingMonitor(),
              onFocusChange: (val) => controller.inputTextTypingMonitor(),
              error: controller.isEmailInvalid.value,
              controller: controller.emailTextEditingController,
            ),
          ),

          AppGap.vertical15,

          /// Password text
          Obx(
            () => BaseTextInput(
              hintText: AppString.password,
              elevation: 5,
              keyboardType: TextInputType.visiblePassword,
              onChanged: (String? val) => controller.inputTextTypingMonitor(),
              onFocusChange: (val) => controller.inputTextTypingMonitor(),
              error: controller.isEmailInvalid.value,
              controller: controller.passwordTextEditingController,
              obscureText: true,
            ),
          ),
          AppGap.vertical10,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextPrimaryButton(
                text: AppString.forgotPassword,
                onPressed: () {},
              )
            ],
          ),
          AppGap.vertical20,

          /// Login button
          Obx(
            () => DefaultPrimaryButton(
              onPressed: () async => await controller.login(),
              disable: controller.isButtonDisabled.value,
              buttonRound: ButtonRound.halfRounded,
              child: Text(AppString.login, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.whiteFFFFFF)),
            ),
          ),
          AppGap.vertical20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [customLoginButton(Assets.iconsFacebook), customLoginButton(Assets.iconsGoogleIcon)],
          ),

          AppGap.vertical30,
          Center(
            child: GestureDetector(onTap: () => Get.toNamed(AppRoutes.SIGNUP_SCREEN), child: AppText.headline6("Create New Account")),
          )
        ],
      ),
    );
  }

  Widget subTitle() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
        ),
        child: Text(
          AppString.subTitle,
          style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(color: AppColor.dark202125, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
      );

  Widget customLoginButton(String svg, {VoidCallback? onPress}) => GestureDetector(
        onTap: onPress,
        child: Card(
          color: AppColor.whiteFFFFFF,
          elevation: 2,
          child: Container(
            height: 56,
            width: 56,
            //margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              color: AppColor.whiteFFFFFF,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: appSVG(svg),
            ),
          ),
        ),
      );
}
