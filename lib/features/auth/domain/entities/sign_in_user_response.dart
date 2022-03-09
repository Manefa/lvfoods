import 'package:equatable/equatable.dart';

class SignInUserResponse extends Equatable{

  final String? username;
  final String? fullname;
  final String? email;
  final String? picture;
  final String? role;

  SignInUserResponse({
    required this.username,
    required this.fullname,
    required this.email,
    required this.picture,
    required this.role,
  });

  @override
  List<Object> get props => [username!, fullname!, email!, picture!, role!];

}