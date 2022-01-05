
import 'package:equatable/equatable.dart';

abstract class GetAllForOwnerRestaurantEvent extends Equatable {
  const GetAllForOwnerRestaurantEvent();
}

class StartGetAllForOwnerRestaurant extends GetAllForOwnerRestaurantEvent{
  final String name;

  StartGetAllForOwnerRestaurant({required this.name});
  @override
  List<Object?> get props => [name];
}
