import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';

abstract class AddHoursEvent extends Equatable {
  const AddHoursEvent();
}

class StartAddHours extends AddHoursEvent{
  final ForAddHours addHours;
  final String name;

  StartAddHours({required this.addHours, required this.name,});
  @override
  List<Object?> get props => [addHours, name];
}
