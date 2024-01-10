import 'dart:core';

class UserModel {
  final String loginId;
  final String password;
  final String email;
  final String nickname;

  UserModel({
    required this.loginId,
    required this.password,
    required this.email,
    required this.nickname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      loginId: json["loginId"],
      password: json["password"],
      email: json["email"],
      nickname: json["nickname"],
    );
  }
}
