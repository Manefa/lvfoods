import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';

abstract class TakeDeliveryState extends Equatable {
  const TakeDeliveryState();
}

class TakeDeliveryEmpty extends TakeDeliveryState {
  @override
  List<Object> get props => [];
}


class TakeDeliveryLoading extends TakeDeliveryState {
  @override
  List<Object> get props => [];
}


class TakeDeliveryLoaded extends TakeDeliveryState {
  final TakeDeliveryMaster takeDeliveryMaster;

  TakeDeliveryLoaded({required this.takeDeliveryMaster});
  @override
  List<Object> get props => [];
}

class TakeDeliveryError extends TakeDeliveryState {
  final String message;

  TakeDeliveryError({required this.message});
  @override
  List<Object> get props => [];
}

