import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {
  @override
  List<Object> get props => ["AppStarted"];
}

class SignIn extends AuthEvent {
  @override
  List<Object> get props => ["SignIn"];
}

class SignOut extends AuthEvent {
  @override
  List<Object> get props => ["SignOut"];
}
