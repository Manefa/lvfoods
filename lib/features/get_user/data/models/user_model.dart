import 'package:ivfoods_mobile_app/features/get_user/data/models/phone_model.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required final String? username,
    required final String? code,
    required final String? fullName,
    required final String? email,
    required final String? picture,
    required final String? password,
    required final String? role,
    required final List<PhoneModel>? phones,
  }) : super(
    username: username,
    code: code,
    fullName: fullName,
    email: email,
    picture: picture,
    password: password,
    role: role,
    phones: phones,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"],
    code: json["code"],
    fullName: json["full_name"],
    email: json["email"],
    picture: json["picture"],
    password: json["password"],
    role: json["role"],
    phones: List<PhoneModel>.from(json["phones"].map((x) => PhoneModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "code": code,
    "full_name": fullName,
    "email": email,
    "picture": picture,
    "password": password,
    "role": role,
    "phones": List<dynamic>.from(phones!.map((x) => x.toJson())),
  };
}