import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/entities/delivered.dart';

abstract class DeliveredRepository {
  Future<Either<Failure, Delivered>> deliveredDelivery(String code,);
}