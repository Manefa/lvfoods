import 'package:equatable/equatable.dart';

abstract class DeliveriesEvent extends Equatable {
  const DeliveriesEvent();
}

class GetDeliveries extends DeliveriesEvent{
  @override
  List<Object?> get props => [];
}
