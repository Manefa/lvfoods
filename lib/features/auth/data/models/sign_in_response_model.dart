import 'package:ivfoods_mobile_app/features/auth/data/models/sign_in_user_response_model.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_response.dart';

class SignInResponseModel extends SignInResponse{

  SignInResponseModel({
    required final bool? success,
    required final SignInUserResponseModel? signInUserResponseModel,
    required final String? token,
  }): super(
    success: success,
    signInUserResponse: signInUserResponseModel,
    token: token,
  );

  factory SignInResponseModel.fromJson(Map<String, dynamic> json){
    return SignInResponseModel (
      success: json['success'],
      signInUserResponseModel: SignInUserResponseModel.fromJson(json['user']),
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'success': success,
      'user': SignInResponseModel,
      'token' : token,
    };
  }
}