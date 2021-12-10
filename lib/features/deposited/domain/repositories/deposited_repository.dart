import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';

abstract class DepositedRepository {
  Future<Either<Failure, Deposited>> updateStatusOrder(String code);
}