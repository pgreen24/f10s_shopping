
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:f10s_shopping/routes/app_routes.dart';

class SplashLogic extends GetxController {

  final GetStorage storage = GetStorage('F10S_Storage');

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    bool isLoggedIn = storage.read('isLoggedIn') ?? false;
    String userKey = storage.read('currentUserKey') ?? '';
    if (userKey.isEmpty) {
      userKey = storage.read('last_logged_in_user') ?? '';
    }

    if (isLoggedIn && userKey.isNotEmpty) {
      await storage.write('currentUserKey', userKey);
      Get.offAllNamed(AppRoutes.home);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}

