import 'package:onigami/app/common/utils.dart';

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  int? stock;
  int? quantity;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.stock,
    this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      stock: json['stock'],
      quantity: json['quantity'],
    );
  }
  //fromMap
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      price: map['price'],
      stock: map['stock'],
      quantity: map['quantity'],
    );
  }

  // tojson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'stock': stock,
      'quantity': quantity,
    };
  }

  String get priceFormatted =>
      Utils.formatCurrency(double.parse(price!) ?? 0, locale: 'id');
}
