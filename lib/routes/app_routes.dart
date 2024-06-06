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

  static final List<GetPage> routes = [
    GetPage(name: INITINAL, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: MOVIE_OVERVIEW, page: () => MovieOverviewScreen(), binding: MovieOverviewBindings()),
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
