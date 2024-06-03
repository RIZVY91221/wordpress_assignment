import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/features/auth/signup/controller/signup_controller.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends BaseView<SignUpController> {
  SignupScreen({super.key});

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
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10, horizontal: AppPadding.p25),
      physics: const ClampingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _circleCard(),
          AppGap.vertical20,
          _inputComponent(hints: "Name", icon: Icons.person_2_outlined),
          _inputComponent(hints: "Email", icon: Icons.email_outlined),
          _inputComponent(hints: "Password", icon: Icons.lock_outline),
          _inputComponent(hints: "Confirm Password", icon: Icons.lock_outline),
          AppGap.vertical20,
          DefaultPrimaryButton(
            onPressed: () {},
            disable: false,
            buttonRound: ButtonRound.halfRounded,
            child: Text("Sign Up", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColor.whiteFFFFFF)),
          ),
          AppGap.vertical20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [customLoginButton(Assets.iconsFacebook), customLoginButton(Assets.iconsGoogleIcon)],
          ),
          AppGap.vertical20,
          RichText(
            text: TextSpan(text: 'Already have an account? ', style: AppTextStyle.headline6(), children: [
              TextSpan(
                text: 'Login',
                style: AppTextStyle.headline7(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = () => Get.offAndToNamed(AppRoutes.LOGIN_SCREEN),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget _inputComponent({String? hints, IconData? icon, TextEditingController? controller}) => Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: BaseTextInput(
          hintText: hints,
          elevation: 0.0,
          keyboardType: TextInputType.text,
          preFIXWidth: 20,
          controller: controller,
          preFIX: Icon(
            icon,
            color: AppColor.darkLightest6C7576,
          ),
        ),
      );

  Widget _circleCard() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(color: AppColor.whiteFFFFFF, borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Image.asset(
              Assets.iconsPersonImage,
            )),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColor.primaryOne4B9EFF,
            ),
            child: Icon(
              Icons.camera_alt,
              color: AppColor.whiteFFFFFF,
              size: 14,
            ),
          ),
        )
      ],
    );
  }

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
