import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/enum.dart';
import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/core/utils/extensions.dart';
import 'package:bs_assignment/core/uttils/functions.dart';
import 'package:bs_assignment/core/values/values.dart';
import 'package:bs_assignment/core/widget/global/divider/wid_divider.dart';
import 'package:bs_assignment/core/widget/global/loading/wid_loading_skeleton.dart';
import 'package:bs_assignment/features/movie/details/controller/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailsScreen extends BaseView<MovieDetailsController> {
  MovieDetailsScreen({super.key}) {
    controller.getMovieDetailsService();
  }

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
    return Obx(() => controller.movieResource.value.movies?.id != null
        ? CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FN.imageWidgetFromBase64(
                      controller.movieResource.value.prettifyMovies?.backDropImage ?? '',
                    ),
                    AppGap.vertical20,
                    headerPart(),
                    AppGap.vertical10,
                    AppDivider(color: AppColor.darkLight4D4D50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.watch_later_outlined, size: 18, color: AppColor.darkLightest6C7576),
                              AppGap.horizontal5,
                              AppText.bodyVerySmall("${controller.movieResource.value.movies?.runtime ?? " "} minutes"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, size: 18, color: AppColor.darkLightest6C7576),
                              AppGap.horizontal5,
                              AppText.bodyVerySmall("${controller.movieResource.value.movies?.runtime ?? " "} minutes"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppDivider(color: AppColor.darkLight4D4D50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText.headline5("Release Date", color: AppColor.whiteFFFFFF),
                              AppGap.vertical10,
                              AppText.bodySmall(controller.movieResource.value.movies?.releaseDate.dateTimeFormat(format: 'MMM dd, yyyy'),
                                  color: AppColor.whiteFFFFFF),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [AppText.headline5("Genre", color: AppColor.whiteFFFFFF), itemCard("Action")],
                          )
                        ],
                      ),
                    ),
                    AppDivider(color: AppColor.darkLight4D4D50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: AppText.headline5("Synopcic", color: AppColor.whiteFFFFFF),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: AppText.bodyExtraSmall(controller.movieResource.value.prettifyMovies?.overview ?? "",
                          color: AppColor.whiteFFFFFF),
                    )
                  ],
                ),
              )
            ],
          )
        : const WidgetLoadingSkeleton(
            pageState: PageState.LOADING,
            rows: 5,
          ));
  }

  Widget headerPart() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: AppText.headline5(controller.movieResource.value.prettifyMovies?.title ?? '', color: AppColor.whiteFFFFFF)),
            AppGap.horizontal10,
            itemCard('4K')
          ],
        ),
      );

  Widget itemCard(String txt) => Card(
        elevation: 5,
        color: AppColor.dark202125,
        surfaceTintColor: AppColor.dark202125,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: AppColor.dark202125,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: AppColor.darkLightest6C7576)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: AppText.bodyVerySmall(txt, color: AppColor.whiteFFFFFF),
          )),
        ),
      );
}
