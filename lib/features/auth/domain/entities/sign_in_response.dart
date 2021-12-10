
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user_response.dart';

class SignInResponse extends Equatable{
  final bool? success;
  final SignInUserResponse? signInUserResponse;
  final String? token;

  SignInResponse({required this.success, required this.signInUserResponse, required this.token});
  @override
  List<Object> get props => [success!, signInUserResponse!, token!];

}