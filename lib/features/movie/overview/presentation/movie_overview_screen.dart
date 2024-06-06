import 'package:bs_assignment/core/base/base_view.dart';
import 'package:bs_assignment/core/theme/text.dart';
import 'package:bs_assignment/features/movie/overview/controller/movie_overview_controller.dart';
import 'package:flutter/material.dart';

class MovieOverviewScreen extends BaseView<MovieOverviewController> {
  MovieOverviewScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: AppText.headline5("text"),
    );
  }
}
