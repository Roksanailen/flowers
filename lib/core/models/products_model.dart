// To parse this JSON data, do
//
//     final productsResponseModel = productsResponseModelFromJson(jsonString);

import 'dart:convert';

ProductsResponseModel productsResponseModelFromJson(String str) => ProductsResponseModel.fromJson(json.decode(str));

String productsResponseModelToJson(ProductsResponseModel data) => json.encode(data.toJson());

class ProductsResponseModel {
  final List<ProductModel>? data;

  ProductsResponseModel({
    this.data,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => ProductsResponseModel(
        data: json["data"] == null ? [] : List<ProductModel>.from(json["data"]!.map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final dynamic priceAfterOffer;
  final String? color;
  final String? occasion;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic softDeletedAt;
  final dynamic softDeletedById;
  final dynamic softDeletedByType;
  final ImageModel? image;
  final dynamic offer;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.priceAfterOffer,
    this.color,
    this.occasion,
    this.createdAt,
    this.updatedAt,
    this.softDeletedAt,
    this.softDeletedById,
    this.softDeletedByType,
    this.image,
    this.offer,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        priceAfterOffer: json["price_after_offer"],
        color: json["color"],
        occasion: json["occasion"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        softDeletedAt: json["_softDeletedAt"],
        softDeletedById: json["_softDeletedById"],
        softDeletedByType: json["_softDeletedByType"],
        image: json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        offer: json["offer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "price_after_offer": priceAfterOffer,
        "color": color,
        "occasion": occasion,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "_softDeletedAt": softDeletedAt,
        "_softDeletedById": softDeletedById,
        "_softDeletedByType": softDeletedByType,
        "image": image?.toJson(),
        "offer": offer,
      };
}

class ImageModel {
  final int? id;
  final String? url;
  final String? blurhash;

  ImageModel({
    this.id,
    this.url,
    this.blurhash,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json["id"],
        url: json["url"],
        blurhash: json["blurhash"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "blurhash": blurhash,
      };
}
