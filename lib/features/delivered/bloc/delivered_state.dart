import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/entities/delivered.dart';

abstract class DeliveredState extends Equatable {
  const DeliveredState();
}

class DeliveredEmpty extends DeliveredState {
  @override
  List<Object> get props => [];
}

class DeliveredLoading extends DeliveredState {
  @override
  List<Object> get props => [];
}

class DeliveredLoaded extends DeliveredState {
  final Delivered delivered;

  DeliveredLoaded({required this.delivered});

  @override
  List<Object> get props => [delivered];
}

class DeliveredError extends DeliveredState {
  final String message;

  DeliveredError({required this.message});
  @override
  List<Object> get props => [message];
}
