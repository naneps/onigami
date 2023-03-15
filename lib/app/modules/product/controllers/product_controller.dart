import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onigami/app/model/product_model.dart';

class ProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString search = "".obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  //TODO: Implement ProductController
  @override
  void onInit() {
    super.onInit();
    // listen firebsase collection products and add to products list
    getProductsFromFireBase().listen((event) {
      for (var element in event.docs) {
        print(element.data());
      }
      products.assignAll(event.docs.map((e) => e.data()).toList());
      update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Stream<QuerySnapshot<ProductModel>> getProductsFromFireBase() {
    return firestore
        .collection('products')
        .where('name', isGreaterThanOrEqualTo: search.value)
        .withConverter<ProductModel>(
          fromFirestore: (snapshot, _) =>
              ProductModel.fromJson(snapshot.data()!),
          toFirestore: (product, _) => product.toJson(),
        )
        .snapshots();
  }

  void addToCart() async {}
}
