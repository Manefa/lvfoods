import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';

abstract class UpdateUserRepository {
  Future<Either<Failure, UserMaster>> updateUser(UserForUpdate userMaster);
}
