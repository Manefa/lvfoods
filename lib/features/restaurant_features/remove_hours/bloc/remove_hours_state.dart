
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/entities/remove_hours.dart';

abstract class RemoveHoursState extends Equatable {
  const RemoveHoursState();
}

class RemoveHoursEmpty extends RemoveHoursState {
  @override
  List<Object> get props => [];
}

class RemoveHoursLoading extends RemoveHoursState {
  @override
  List<Object> get props => [];
}

class RemoveHoursLoaded extends RemoveHoursState {
  final RemoveHours hours;

  RemoveHoursLoaded({required this.hours});
  @override
  List<Object> get props => [hours];
}

class RemoveHoursError extends RemoveHoursState {
  final String message;

  RemoveHoursError({required this.message});
  @override
  List<Object> get props => [message];
}

