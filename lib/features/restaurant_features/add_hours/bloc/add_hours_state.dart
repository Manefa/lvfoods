

import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/add_hours.dart';

abstract class AddHoursState extends Equatable {
  const AddHoursState();
}

class AddHoursEmpty extends AddHoursState {
  @override
  List<Object> get props => [];
}

class AddHoursLoading extends AddHoursState {
  @override
  List<Object> get props => [];
}

class AddHoursLoaded extends AddHoursState {
  final AddHours hours;

  AddHoursLoaded({required this.hours});
  @override
  List<Object> get props => [hours];
}

class AddHoursError extends AddHoursState {
  final String message;

  AddHoursError({required this.message});
  @override
  List<Object> get props => [message];
}

