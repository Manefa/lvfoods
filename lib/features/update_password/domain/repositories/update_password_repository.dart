import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/send_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';

abstract class UpdatePasswordRepository {
  Future<Either<Failure, UpdatePasswordMaster>> sendPassword(SendPassword sendPassword);
}