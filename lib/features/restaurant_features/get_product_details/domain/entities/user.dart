import 'package:equatable/equatable.dart';

class User extends Equatable{

  final String? username;
  final String? fullName;
  final String? picture;

  User({
    required this.username,
    required this.fullName,
    required this.picture,
  });

  // factory User.fromJson(Map<String, dynamic> json) => User(
  //   username: json["username"] == null ? null : json["username"],
  //   fullName: json["full_name"] == null ? null : json["full_name"],
  //   picture: json["picture"] == null ? null : json["picture"],
  // );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "full_name": fullName == null ? null : fullName,
    "picture": picture == null ? null : picture,
  };

  @override
  List<Object?> get props => [username, fullName, picture];
}