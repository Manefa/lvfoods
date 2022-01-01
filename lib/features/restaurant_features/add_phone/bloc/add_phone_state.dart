
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/add_phone.dart';

abstract class AddPhoneState extends Equatable {
  const AddPhoneState();
}

class AddPhoneEmpty extends AddPhoneState {
  @override
  List<Object> get props => [];
}

class AddPhoneLoading extends AddPhoneState {
  @override
  List<Object> get props => [];
}

class AddPhoneLoaded extends AddPhoneState {
  final AddPhone phone;

  AddPhoneLoaded({required this.phone});
  @override
  List<Object> get props => [phone];
}

class AddPhoneError extends AddPhoneState {
  final String message;

  AddPhoneError({required this.message});
  @override
  List<Object> get props => [message];
}

