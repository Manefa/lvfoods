import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthState {
  @override
  List<Object> get props => ["Uninitialized"];
}

class Authenticated extends AuthState {

  @override
  List<Object> get props => [];
}

class Unauthenticated extends AuthState {
  @override
  List<Object> get props => ["Unauthenticated"];
}
