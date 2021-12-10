import 'package:equatable/equatable.dart';

abstract class OrderGroupPaidEvent extends Equatable {
  const OrderGroupPaidEvent();
}

class PaidOrderGroup extends OrderGroupPaidEvent{
  final String code;

  PaidOrderGroup({required this.code});
  @override
  List<Object?> get props => [code];
}