import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/get_one_for_deliver.dart';

abstract class GetOneForDeliverRepository {
  Future<Either<Failure, GetOneForDeliver>> getOneForDeliver(String code);
}