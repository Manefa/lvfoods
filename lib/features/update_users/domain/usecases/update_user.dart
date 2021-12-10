
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/update_user/update_user.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/repositories/update_user_repository.dart';

class UpdateUserUseCase extends UseCaseUpdateUser<UserMaster, Params>{
  final UpdateUserRepository repository;

  UpdateUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserMaster>> call(Params params) async {
    return await repository.updateUser(params.userMaster);
  }
}

class Params extends Equatable {
  final UserForUpdate userMaster;

  Params({required this.userMaster});

  @override
  List<Object> get props => [userMaster];
}