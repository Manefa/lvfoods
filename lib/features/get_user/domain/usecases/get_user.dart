import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/get_user/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user_master.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/repositories/get_user_repository.dart';

class GetUserUseCase extends UseCaseGetUser<UserMaster, NoParams>{
  final GetUserRepository repository;

  GetUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserMaster>> call(NoParams params) async {
    return await repository.getUser();
  }
}