import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';

abstract class TakeDeliveryRepository {
  Future<Either<Failure, TakeDeliveryMaster>> takeDelivery(String code);
}