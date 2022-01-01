
import 'package:equatable/equatable.dart';

abstract class GetRestaurantEvent extends Equatable {
  const GetRestaurantEvent();
}

class StartGetRestaurant extends GetRestaurantEvent{
  final String name;

  StartGetRestaurant({required this.name});
  @override
  List<Object?> get props => [name];
}