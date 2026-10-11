import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToNext();
  }

  void _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!isClosed) {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
