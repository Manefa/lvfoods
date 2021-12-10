import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';

abstract class PaidDeliveryRepository {
  Future<Either<Failure, PaidDeliveryMaster>> paidDelivery(String code);
}