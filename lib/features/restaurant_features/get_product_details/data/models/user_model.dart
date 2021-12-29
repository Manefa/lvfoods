
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/user.dart';

class UserModel extends User{

  UserModel({
    required String? username,
    required String? fullName,
    required String? picture,
  }) : super(
    username: username,
    fullName: fullName,
    picture: picture,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    username: json["username"] == null ? null : json["username"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    picture: json["picture"] == null ? null : json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "username": username == null ? null : username,
    "full_name": fullName == null ? null : fullName,
    "picture": picture == null ? null : picture,
  };

  @override
  List<Object?> get props => [username, fullName, picture];
}