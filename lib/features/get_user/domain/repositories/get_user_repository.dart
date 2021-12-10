import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user_master.dart';

abstract class GetUserRepository {
  Future<Either<Failure, UserMaster>> getUser();
}
