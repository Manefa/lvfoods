import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/for_update_restaurant.dart';

abstract class UpdateRestaurantEvent extends Equatable {
  const UpdateRestaurantEvent();
}

class StartUpdateRestaurant extends UpdateRestaurantEvent{
  final ForUpdateRestaurant updateRestaurant;
  final String name;

  StartUpdateRestaurant({required this.updateRestaurant, required this.name});
  @override
  List<Object?> get props => [updateRestaurant];
}
