import 'package:equatable/equatable.dart';

abstract class RemoveHoursEvent extends Equatable {
  const RemoveHoursEvent();
}

class StartRemoveHours extends RemoveHoursEvent{
  final String hours;
  final String name;

  StartRemoveHours({required this.hours, required this.name,});
  @override
  List<Object?> get props => [hours, name];
}
