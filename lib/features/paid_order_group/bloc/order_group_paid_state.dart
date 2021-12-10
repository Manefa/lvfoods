import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';

abstract class OrderGroupPaidState extends Equatable {
  const OrderGroupPaidState();
}

class OrderGroupPaidEmpty extends OrderGroupPaidState {
  @override
  List<Object> get props => [];
}

class OrderGroupPaidLoading extends OrderGroupPaidState {
  @override
  List<Object> get props => [];
}

class OrderGroupPaidLoaded extends OrderGroupPaidState {
  final OrderGroupPaid orderGroupPaid;

  OrderGroupPaidLoaded({required this.orderGroupPaid});
  @override
  List<Object> get props => [];
}

class OrderGroupPaidError extends OrderGroupPaidState {
  final String message;

  OrderGroupPaidError({required this.message});
  @override
  List<Object> get props => [message];
}
