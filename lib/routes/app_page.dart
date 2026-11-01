import 'package:f10s_shopping/module/home/home_binding.dart';
import 'package:f10s_shopping/module/home/home_view.dart';
import 'package:f10s_shopping/module/shimmer/shimmer_binding.dart';
import 'package:f10s_shopping/module/sign_in/sign_in_binding.dart';
import 'package:f10s_shopping/module/sign_in/sign_in_view.dart';
import 'package:f10s_shopping/module/splash/splash_binding.dart';
import 'package:f10s_shopping/module/splash/splash_view.dart';
import 'package:get/get.dart';

import '../module/login/login_binding.dart';
import '../module/login/login_view.dart';
import '../module/shimmer/shimmer_view.dart';
import 'app_routes.dart';
class AppPage {

  AppPage._();

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
      binding: ShimmerBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView (),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const SignInView (),
      binding: SignInBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}