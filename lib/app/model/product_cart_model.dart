import 'package:onigami/app/model/product_model.dart';

class ProductCartModel {
  ProductModel? product;
  int? quantity;
  ProductCartModel({
    this.product,
    this.quantity,
  });

  ProductCartModel.fromJson(Map<String, dynamic> json) {
    product = json['product'] != null
        ? ProductModel.fromJson(json['product'] as Map<String, dynamic>)
        : null;
    quantity = json['quantity'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['quantity'] = quantity;
    return data;
  }
}
