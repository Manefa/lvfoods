import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/for_create_restaurant.dart';

abstract class AddRestaurantEvent extends Equatable {
  const AddRestaurantEvent();
}

class StartAddRestaurant extends AddRestaurantEvent{
  final ForCreateRestaurant createRestaurant;

  StartAddRestaurant({required this.createRestaurant});
  @override
  List<Object?> get props => [createRestaurant];
}
