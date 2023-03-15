import 'package:get/get.dart';
import 'package:onigami/app/common/ui/filter_product_widget.dart';
import 'package:onigami/app/modules/home/controllers/home_controller.dart';
import 'package:onigami/app/modules/product/controllers/product_controller.dart';
import 'package:onigami/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/core_controller.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoreController>(
      () => CoreController(),
    );
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<FilterProductController>(() => FilterProductController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
