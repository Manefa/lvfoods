import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class Submitted extends SignInEvent {
  final SignInUser signInUser;

  Submitted({required this.signInUser});

  @override
  String toString() {
    return 'Submitted { signinuser: $signInUser}';
  }

  @override
  List<Object> get props => [signInUser];
}


