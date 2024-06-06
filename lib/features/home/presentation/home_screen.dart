import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/button/app_button.dart';
import 'package:bs_assignment/core/widget/global/card/card2.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/core/widget/global/pagination/pagging_view.dart';
import 'package:bs_assignment/core/widget/global/sidebar/wid_appbar.dart';
import 'package:bs_assignment/core/widget/user/fab_bottom_app_bar.dart';
import 'package:bs_assignment/features/home/controller/home_controller.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/models/product/product_resource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends BaseView<HomeController> {
  HomeScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return baseAppBar(
        title: "Product List", backgroundColor: AppColor.scaffoldColor, titleColor: AppColor.dark202125, showBorderBottom: false);
  }

  @override
  Color pageBackgroundColor() {
    return AppColor.scaffoldColor;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        AppGap.vertical15,
        widFilterBar(
            onPressShortBy: () => Get.bottomSheet(
                  widBottomSheet(),
                  elevation: 5,
                  backgroundColor: AppColor.whiteFFFFFF,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                  ),
                )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: PagingView<ProductResource>(
              isGridView: true,
              pagingController: controller.paginationController.pagingController,
              itemBuilder: (context, item, i) => ProductCard(productResource: item)),
        ))
      ],
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return FABBottomAppBar(
      color: AppColor.darkLightest6C7576,
      backgroundColor: AppColor.whiteLightestGrayF8F8F8,
      selectedColor: AppColor.primaryOne4B9EFF,
      height: 52,
      notchedShape: const CircularNotchedRectangle(),
      onTabSelected: (v) {
        debugPrint('$v');
      },
      items: [
        FABBottomAppBarItem(
          iconData: Icons.home_outlined,
        ),
        FABBottomAppBarItem(
          iconData: Icons.dashboard_outlined,
        ),
        FABBottomAppBarItem(
          iconData: Icons.shopping_cart_outlined,
        ),
        FABBottomAppBarItem(
          iconData: Icons.person_3_outlined,
        ),
      ],
    );
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColor.primaryOne4B9EFF,
      shape: const CircleBorder(),
      onPressed: () {},
      tooltip: 'Increment',
      elevation: 2.0,
      child: Icon(
        Icons.search_outlined,
        color: AppColor.whiteFFFFFF,
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  @override
  FloatingActionButtonLocation floatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerDocked;
  }

  Widget widFilterBar({VoidCallback? onPressShortBy}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Card(
          color: AppColor.whiteFFFFFF,
          surfaceTintColor: AppColor.whiteFFFFFF,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 60,
            decoration: BoxDecoration(
              color: AppColor.whiteFFFFFF,
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [appSVG(Assets.svgFilter), AppGap.horizontal8, AppText.bodyVerySmall("Filter")],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: onPressShortBy,
                        child: Row(
                          children: [AppText.bodyVerySmall("Short by"), AppGap.horizontal5, const Icon(Icons.keyboard_arrow_down_outlined)],
                        ),
                      ),
                      AppGap.horizontal10,
                      const Icon(
                        Icons.list_outlined,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget widBottomSheet() => SizedBox(
        height: 350,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGap.vertical20,
              AppText.headline5("Filter"),
              AppGap.vertical30,
              Obx(
                () => BaseCheckboxGroupInput(
                  typeList: const ["Newest", "Oldest", "Price low > high", "Price high > low"],
                  initialValue: controller.selectFilter.value,
                  disableColor: AppColor.darkLight4D4D50,
                  onChangeValue: (value) {
                    debugPrint(value);
                    controller.selectFilter.value = value;
                    debugPrint(controller.selectFilter.value);
                  },
                ),
              ),
              AppGap.vertical20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultSecondaryButton(
                    text: "Cancel",
                    buttonSize: ButtonSize.auto,
                    buttonRound: ButtonRound.microRound,
                    onPressed: () {},
                  ),
                  DefaultPrimaryButton(
                    text: "Apply",
                    buttonSize: ButtonSize.auto,
                    buttonRound: ButtonRound.microRound,
                    onPressed: () => controller.onApplyFilter(),
                  )
                ],
              )
            ],
          ),
        ),
      );
}
