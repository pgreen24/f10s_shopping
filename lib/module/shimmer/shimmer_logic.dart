import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class ShimmerLogic extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _Nextpage();
  }

  void _Nextpage() async {
    await Future.delayed(const Duration(seconds: 5));
    if (!isClosed) {
      Get.offAllNamed(AppRoutes.home);
    }
  }

}
