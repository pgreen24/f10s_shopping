import 'package:f10s_shopping/module/splash/splash_binding.dart';
import 'package:f10s_shopping/module/splash/splash_view.dart';
import 'package:get/get.dart';

import '../module/shimmer/shimmer_view.dart';
import 'app_routes.dart';
class AppPage {
  static final initial = AppRoutes.splash;
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.shimmer,
      page: () => const ShimmerPage(),
    ),
  ];
}