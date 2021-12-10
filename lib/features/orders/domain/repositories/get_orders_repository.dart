import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/orders_masters.dart';

abstract class GetOrdersRepository {
  Future<Either<Failure, OrdersMasters>> getOrders();
}
