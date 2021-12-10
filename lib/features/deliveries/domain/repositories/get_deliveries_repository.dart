import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';

abstract class GetDeliveriesRepository {
  Future<Either<Failure, DeliveriesMasters>> getDeliveries();
}
