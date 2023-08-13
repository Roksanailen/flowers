// To parse this JSON data, do
//
//     final orderResponseModel = orderResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flowers/core/models/products_model.dart';

OrderResponseModel orderResponseModelFromJson(String str) =>
    OrderResponseModel.fromJson(json.decode(str));

String orderResponseModelToJson(OrderResponseModel data) =>
    json.encode(data.toJson());

class OrderResponseModel {
  final List<OrderModel> data;

  OrderResponseModel({
    required this.data,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        data: List<OrderModel>.from(
            json["data"].map((x) => OrderModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class OrderModel {
  final int id;
  final String totalPrice;
  final dynamic deliverdAt;
  final DateTime orderDate;
  final int status;
  final String totalProductsCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic softDeletedAt;
  final dynamic softDeletedById;
  final dynamic softDeletedByType;
  final String locale;
  final List<ProductModel> flowers;

  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.deliverdAt,
    required this.orderDate,
    required this.status,
    required this.totalProductsCount,
    required this.createdAt,
    required this.updatedAt,
    required this.softDeletedAt,
    required this.softDeletedById,
    required this.softDeletedByType,
    required this.locale,
    required this.flowers,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        totalPrice: json["total_price"],
        deliverdAt: json["deliverd_at"],
        orderDate: DateTime.parse(json["order_date"]),
        status: json["status"],
        totalProductsCount: json["total_products_count"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        softDeletedAt: json["_softDeletedAt"],
        softDeletedById: json["_softDeletedById"],
        softDeletedByType: json["_softDeletedByType"],
        locale: json["locale"],
        flowers: List<ProductModel>.from(
            json["flowers"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "total_price": totalPrice,
        "deliverd_at": deliverdAt,
        "order_date": orderDate.toIso8601String(),
        "status": status,
        "total_products_count": totalProductsCount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "_softDeletedAt": softDeletedAt,
        "_softDeletedById": softDeletedById,
        "_softDeletedByType": softDeletedByType,
        "locale": locale,
        "flowers": List<dynamic>.from(flowers.map((x) => x.toJson())),
      };

  OrderModel copyWith({
    int? id,
    String? totalPrice,
    dynamic? deliverdAt,
    DateTime? orderDate,
    int? status,
    String? totalProductsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic? softDeletedAt,
    dynamic? softDeletedById,
    dynamic? softDeletedByType,
    String? locale,
    List<ProductModel>? flowers,
  }) {
    return OrderModel(
      id: id ?? this.id,
      totalPrice: totalPrice ?? this.totalPrice,
      deliverdAt: deliverdAt ?? this.deliverdAt,
      orderDate: orderDate ?? this.orderDate,
      status: status ?? this.status,
      totalProductsCount: totalProductsCount ?? this.totalProductsCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      softDeletedAt: softDeletedAt ?? this.softDeletedAt,
      softDeletedById: softDeletedById ?? this.softDeletedById,
      softDeletedByType: softDeletedByType ?? this.softDeletedByType,
      locale: locale ?? this.locale,
      flowers: flowers ?? this.flowers,
    );
  }
}
