import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/widget/global/card/card2.dart';
import 'package:bs_assignment/core/widget/global/input_field/app_input.dart';
import 'package:bs_assignment/core/widget/global/pagination/pagging_view.dart';
import 'package:bs_assignment/core/widget/global/tabbar/wid_tab_bar.dart';
import 'package:bs_assignment/core/widget/user/fab_bottom_app_bar.dart';
import 'package:bs_assignment/features/movie/overview/controller/movie_overview_controller.dart';
import 'package:bs_assignment/models/movies/movie_resource.dart';
import 'package:bs_assignment/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieOverviewScreen extends BaseView<MovieOverviewController> {
  MovieOverviewScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Color pageBackgroundColor() {
    return AppColor.dark202125;
  }

  @override
  Color statusBarColor() {
    return AppColor.dark202125;
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AppText.headline3("Find Movies, Tv Series, and more..", color: AppColor.whiteFFFFFF),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: BaseTextInput(
            hintText: "Search",
            fillColor: AppColor.darkLight4D4D50,
            preFIXSideGap: 10,
            preFIXWidth: 30,
            preFIX: Icon(
              Icons.search_outlined,
              color: AppColor.darkLightest6C7576,
            ),
            readOnly: true,
          ),
        ),
        SizedBox(
          height: 50,
          child: CustomTabBar2(
            tabData: [
              TabData(index: 1, title: "Movie"),
              TabData(index: 2, title: "Tv Series"),
              TabData(index: 3, title: "Documentary"),
              TabData(index: 4, title: "Sports"),
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: PagingView<MovieResource>(
              isGridView: true,
              pagingController: controller.paginationController.pagingController,
              itemBuilder: (context, item, i) => MovieCard(
                    productResource: item,
                    onPressCard: () async =>
                        await Get.toNamed(AppRoutes.MOVIE_DETAILS, arguments: <String, dynamic>{"id": item.movies?.id}),
                  )),
        ))
      ],
    );
  }

  @override
  Widget? bottomNavigationBar() {
    return FABBottomAppBar(
      color: AppColor.darkLightest6C7576,
      backgroundColor: AppColor.darkLight4D4D50,
      selectedColor: AppColor.primaryOne4B9EFF,
      height: 52,
      notchedShape: const CircularNotchedRectangle(),
      onTabSelected: (v) {},
      items: [
        FABBottomAppBarItem(
          iconData: Icons.home_outlined,
        ),
        FABBottomAppBarItem(
          iconData: Icons.dashboard_outlined,
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
        Icons.play_arrow,
        color: AppColor.whiteFFFFFF,
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  @override
  FloatingActionButtonLocation floatingActionButtonLocation() {
    return FloatingActionButtonLocation.centerDocked;
  }
}
