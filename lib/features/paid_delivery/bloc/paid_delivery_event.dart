import 'package:equatable/equatable.dart';

abstract class PaidDeliveryEvent extends Equatable {
  const PaidDeliveryEvent();
}

class StartPaidDelivery extends PaidDeliveryEvent{
  final String code;

  StartPaidDelivery({required this.code});

  @override
  List<Object?> get props => [code];
}