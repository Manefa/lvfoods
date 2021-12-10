import 'package:equatable/equatable.dart';

class SignInUserResponse extends Equatable{

  final String? username;
  final String? fullname;
  final String? email;
  final String? picture;

  SignInUserResponse({required this.username,
  required this.fullname,
  required this.email,
  required this.picture});

  @override
  List<Object> get props => [username!, fullname!, email!, picture!];

}