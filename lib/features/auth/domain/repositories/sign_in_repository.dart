import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user.dart';

abstract class SignInRepository {
  Future<Either<Failure, SignInResponse>> login(SignInUser user);
}