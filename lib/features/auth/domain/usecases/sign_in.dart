import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/login_usecases/login_usecase.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/repositories/sign_in_repository.dart';

class SignInUseCase extends UseCaseSignIn<SignInResponse, Params> {
  final SignInRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, SignInResponse>> call(Params params) async {
    return await repository.login(params.signInUser);
  }
}

class Params extends Equatable {
  final SignInUser signInUser;

  Params({required this.signInUser});

  @override
  List<Object> get props => [signInUser];
}