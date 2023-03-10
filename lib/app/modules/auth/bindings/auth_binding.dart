import 'package:get/get.dart';
import 'package:onigami/app/providers/auht_provider.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}
