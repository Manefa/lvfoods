import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    final String? username,
    final String? fullName,
    final String? email,
    final String? image,
  }) : super(
    username: username,
    fullName: fullName,
    email: email,
    image: image,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"] == null ? null : json["username"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    email: json["email"] == null ? null : json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "full_name": fullName == null ? null : fullName,
    "email": email == null ? null : email,
  };
}