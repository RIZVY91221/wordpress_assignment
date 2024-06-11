import 'package:bs_assignment/features/movie/details/bindings/movie_details_bindings.dart';
import 'package:bs_assignment/features/movie/details/presentation/movie_details_screen.dart';
import 'package:bs_assignment/features/movie/overview/bindings/movie_overview_bindings.dart';
import 'package:bs_assignment/features/movie/overview/presentation/movie_overview_screen.dart';
import 'package:bs_assignment/features/splash/binding/splash_binding.dart';
import 'package:bs_assignment/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  //static variables
  static const String INITINAL = '/';
  static const String MOVIE_OVERVIEW = '/MOVIE_OVERVIEW';
  static const String MOVIE_DETAILS = '/MOVIE_DETAILS';

  static final List<GetPage> routes = [
    GetPage(name: INITINAL, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: MOVIE_OVERVIEW, page: () => MovieOverviewScreen(), binding: MovieOverviewBindings()),
    GetPage(name: MOVIE_DETAILS, page: () => MovieDetailsScreen(), binding: MovieDetailsBindings()),
  ];

  static generateRoute(RouteSettings settings) {
    return GetPageRoute(page: () => _generatePage(settings), binding: _generateBinding(settings));
  }

  static Widget _generatePage(RouteSettings settings) {
    switch (settings.name) {
      default:
        return Container();
    }
  }

  static Bindings? _generateBinding(RouteSettings settings) {
    switch (settings.name) {
      default:
        return null;
    }
  }
}
