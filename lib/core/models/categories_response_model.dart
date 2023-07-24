// To parse this JSON data, do
//
//     final categoriesResponseModel = categoriesResponseModelFromJson(jsonString);

import 'dart:convert';

CategoriesResponseModel categoriesResponseModelFromJson(String str) =>
    CategoriesResponseModel.fromJson(json.decode(str));

String categoriesResponseModelToJson(CategoriesResponseModel data) => json.encode(data.toJson());

class CategoriesResponseModel {
  final List<CategoryDataModel>? data;

  CategoriesResponseModel({
    this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => CategoriesResponseModel(
        data: json["data"] == null
            ? []
            : List<CategoryDataModel>.from(json["data"]!.map((x) => CategoryDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryDataModel {
  final int? id;
  final CategoryModel? attributes;

  CategoryDataModel({
    this.id,
    this.attributes,
  });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => CategoryDataModel(
        id: json["id"],
        attributes: json["attributes"] == null ? null : CategoryModel.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class CategoryModel {
  final String? name;

  CategoryModel({
    this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
