// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
    CartModel({
        required this.key,
        required this.productId,
        required this.productName,
        required this.productPrice,
        required this.productImage,
        required this.quantity,
    });

    String key;
    int productId;
    String productName;
    String productPrice;
    String productImage;
    int quantity;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        key: json["key"],
        productId: json["product_id"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        productImage: json["product_image"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "product_id": productId,
        "product_name": productName,
        "product_price": productPrice,
        "product_image": productImage,
        "quantity": quantity,
    };
}