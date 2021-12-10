import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/order_group_paid/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/repositories/order_group_paid_repository.dart';

class OrderGroupPaidUseCase extends UseCaseOrderGroupPaid<OrderGroupPaid, Params>{
  final OrderGroupPaidRepository repository;
  OrderGroupPaidUseCase(this.repository);

  @override
  Future<Either<Failure, OrderGroupPaid>> call(Params params) async {
    return await repository.paidOrderGroup(params.code);
  }
}

class Params extends Equatable{
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}