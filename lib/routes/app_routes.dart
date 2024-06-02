import 'package:bs_assignment/features/auth/presentation/screen_repository_list.dart';
import 'package:bs_assignment/features/splash/binding/splash_binding.dart';
import 'package:bs_assignment/features/splash/presentation/splash_screen.dart';
import 'package:bs_assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  //static variables
  static const String INITINAL = '/';
  static const String REPO_LIST = '/REPO_LIST';

  static final List<GetPage> routes = [
    GetPage(name: INITINAL, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: REPO_LIST, page: () => const RepositoryListScreen()),
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
