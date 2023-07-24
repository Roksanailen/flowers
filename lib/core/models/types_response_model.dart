// To parse this JSON data, do
//
//     final typesResponseModel = typesResponseModelFromJson(jsonString);

import 'dart:convert';

TypesResponseModel typesResponseModelFromJson(String str) => TypesResponseModel.fromJson(json.decode(str));

String typesResponseModelToJson(TypesResponseModel data) => json.encode(data.toJson());

class TypesResponseModel {
  final List<Types>? data;

  TypesResponseModel({
    this.data,
  });

  factory TypesResponseModel.fromJson(Map<String, dynamic> json) => TypesResponseModel(
        data: json["data"] == null ? [] : List<Types>.from(json["data"]!.map((x) => Types.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Types {
  final int? id;
  final String? name;

  Types({
    this.id,
    this.name,
  });

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
