import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user_response.dart';

class SignInUserResponseModel extends SignInUserResponse{
  SignInUserResponseModel({
    required final String? username,
    required final String? fullname,
    required final String? email,
    required final String? picture,
}): super(
    username: username,
    fullname: fullname,
    email: email,
    picture: picture,
  );

  factory SignInUserResponseModel.fromJson(Map<String, dynamic> json){
      return SignInUserResponseModel(
        username: json['username'],
        fullname: json['fullname'],
        email: json['email'],
        picture: json['picture'],
      );
  }

  Map<String, dynamic> toJson(){
    return {
      'username': username,
      'fullname': fullname,
      'email': email,
      'picture': picture,
    };
  }
}