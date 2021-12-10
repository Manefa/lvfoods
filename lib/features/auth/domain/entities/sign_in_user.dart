import 'package:equatable/equatable.dart';

class SignInUser extends Equatable{
  final String username;
  final String password;

  SignInUser({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}