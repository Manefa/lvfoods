import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';

abstract class OrderGroupPaidRepository {
  Future<Either<Failure, OrderGroupPaid>> paidOrderGroup(String code);
}