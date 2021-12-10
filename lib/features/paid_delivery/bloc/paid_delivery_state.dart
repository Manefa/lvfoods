import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';

abstract class PaidDeliveryState extends Equatable {
  const PaidDeliveryState();
}

class PaidDeliveryEmpty extends PaidDeliveryState {
  @override
  List<Object> get props => [];
}

class PaidDeliveryLoading extends PaidDeliveryState {
  @override
  List<Object> get props => [];
}

class PaidDeliveryLoaded extends PaidDeliveryState {
  final PaidDeliveryMaster paidDeliveryMaster;

  PaidDeliveryLoaded({required this.paidDeliveryMaster});
  @override
  List<Object> get props => [paidDeliveryMaster];
}

class PaidDeliveryError extends PaidDeliveryState {
  final String message;

  PaidDeliveryError({required this.message});
  @override
  List<Object> get props => [message];
}
