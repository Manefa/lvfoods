import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';

abstract class DeliveriesState extends Equatable {
  const DeliveriesState();
}

class EmptyDeliveries extends DeliveriesState{
  @override
  List<Object?> get props => [];
}

class LoadingDeliveries extends DeliveriesState{
  @override
  List<Object?> get props => [];
}

class LoadedDeliveries extends DeliveriesState{
  final DeliveriesMasters deliveriesMasters;

  LoadedDeliveries({required this.deliveriesMasters});

  @override
  List<Object?> get props => [deliveriesMasters];
}

class ErrorDeliveries extends DeliveriesState{
  final String message;

  ErrorDeliveries({required this.message});

  @override
  List<Object?> get props => [message];
}