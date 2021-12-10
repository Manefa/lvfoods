import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';

abstract class StartDepositionRepository {
  Future<Either<Failure, StartDeposition>> updateStatusOrder(String code);
}