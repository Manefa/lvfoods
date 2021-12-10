import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';

abstract class StartRecoveryRepository {
  Future<Either<Failure, StartRecovery>> updateStatusOrder(String code);
}