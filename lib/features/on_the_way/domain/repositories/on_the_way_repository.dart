import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/entities/on_the_way.dart';

abstract class OnTheWayRepository {
  Future<Either<Failure, OnTheWay>> inProgressDelivery(String code);
}