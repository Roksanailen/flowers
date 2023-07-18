import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_appflowers/core/unified_api/api_variables.dart';
import 'package:flutter_appflowers/core/unified_api/post_api.dart';
import 'package:flutter_appflowers/home_viewModel.dart';
import 'package:get/get.dart';

import '../Production.dart';
import '../core/global_functions.dart';

class RegisterController extends GetxController {
  final usernameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  bool isLoading = false;
  void register() async {
    isLoading = true;
    final RegisterModel? registerModel=
    await RegisterRequests().register(usernameController.value.text,emailController.value.text, passwordController.value.text,phoneController.value.text, );
    if (registerModel != null) {
      GlobalFunctions().setUserInfo(user: registerModel.user!, accessToken: registerModel.jwt);
      isLoading = false;
      Get.offAll(Production());
    }
    log(registerModel.toString(), name: 'omar');
  }
}

class RegisterRequests {
  Future<RegisterModel?> register(username,email, password,phone) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().register(),
        body: {"usernamer": username,"email":email, "password": password,"phone":phone},
        fromJson: registerModelFromJson);
    final RegisterModel? result = await postApi.callRequest();
    return result;
  }
}
// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);



RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  String jwt;
  User user;

  RegisterModel({
    required this.jwt,
    required this.user,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    jwt: json["jwt"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "jwt": jwt,
    "user": user.toJson(),
  };
}

class User {
  int id;
  String username;
  String email;
  bool confirmed;
  bool blocked;
  DateTime createdAt;
  DateTime updatedAt;
  String provider;
  String phone;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.confirmed,
    required this.blocked,
    required this.createdAt,
    required this.updatedAt,
    required this.provider,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    confirmed: json["confirmed"],
    blocked: json["blocked"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    provider: json["provider"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "confirmed": confirmed,
    "blocked": blocked,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "provider": provider,
    "phone": phone,
  };
}
