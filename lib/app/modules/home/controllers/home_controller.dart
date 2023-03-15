import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:onigami/app/model/product_model.dart';

class HomeController extends GetxController with StateMixin {
  //TODO: Implement HomeController
  RxList<ProductModel> bestSellerProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    bestSellerProducts.value = [];
  }

  @override
  void onReady() {
    super.onReady();
    ever(bestSellerProducts, (_) {
      change(bestSellerProducts, status: RxStatus.success());
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
