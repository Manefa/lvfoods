
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/entities/remove_phone.dart';

abstract class RemovePhoneState extends Equatable {
  const RemovePhoneState();
}

class RemovePhoneEmpty extends RemovePhoneState {
  @override
  List<Object> get props => [];
}

class RemovePhoneLoading extends RemovePhoneState {
  @override
  List<Object> get props => [];
}

class RemovePhoneLoaded extends RemovePhoneState {
  final RemovePhone phone;

  RemovePhoneLoaded({required this.phone});
  @override
  List<Object> get props => [phone];
}

class RemovePhoneError extends RemovePhoneState {
  final String message;

  RemovePhoneError({required this.message});
  @override
  List<Object> get props => [message];
}

