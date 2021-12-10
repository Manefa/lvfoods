import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable{
  const SignInState();
}

class SignInInitial extends SignInState {

  @override
  List<Object> get props => ["initialState"];
}

class SignInLoading extends SignInState {

  @override
  List<Object> get props => ["Loading"];
}

class SignInError extends SignInState {
  final String message;

  SignInError({required this.message});

  @override
  List<Object> get props => [this.message];
}

class SignInSuccess extends SignInState {

  @override
  List<Object> get props => ["Success"];
}


