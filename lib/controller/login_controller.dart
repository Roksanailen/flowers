import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_appflowers/Production.dart';
import 'package:flutter_appflowers/core/global_functions.dart';
import 'package:flutter_appflowers/core/unified_api/api_variables.dart';
import 'package:flutter_appflowers/core/unified_api/post_api.dart';
import 'package:flutter_appflowers/home_viewModel.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController().obs;

  final passwordController = TextEditingController().obs;
  bool isLoading = false;
  void login() async {
    isLoading = true;
    final LoginModel? loginModel =
        await LoginRequests().login(usernameController.value.text, passwordController.value.text);
    if (loginModel != null) {
      GlobalFunctions().setUserInfo(user: loginModel.user!, accessToken: loginModel.jwt);
      isLoading = false;
      Get.offAll(Production());
    }
    log(loginModel.toString(), name: 'omar');
  }
}

class LoginRequests {
  Future<LoginModel?> login(username, password) async {
    PostApi postApi = PostApi(
        uri: ApiVariables().login(),
        body: {"identifier": username, "password": password},
        fromJson: loginModelFromJson);
    final LoginModel? result = await postApi.callRequest();
    return result;
  }
}

// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? jwt;
  final User? user;

  LoginModel({
    this.jwt,
    this.user,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        jwt: json["jwt"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final String? username;
  final String? email;
  final bool? confirmed;
  final bool? blocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? provider;

  User({
    this.id,
    this.username,
    this.email,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.provider,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        provider: json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "provider": provider,
      };
}
