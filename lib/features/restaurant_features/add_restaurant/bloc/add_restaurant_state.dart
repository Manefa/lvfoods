
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/create_restaurant.dart';

abstract class AddRestaurantState extends Equatable {
  const AddRestaurantState();
}

class AddRestaurantEmpty extends AddRestaurantState {
  @override
  List<Object> get props => [];
}

class AddRestaurantLoading extends AddRestaurantState {
  @override
  List<Object> get props => [];
}

class AddRestaurantLoaded extends AddRestaurantState {
  final CreateRestaurant createRestaurant;

  AddRestaurantLoaded({required this.createRestaurant});
  @override
  List<Object> get props => [createRestaurant];
}

class AddRestaurantError extends AddRestaurantState {
  final String message;

  AddRestaurantError({required this.message});
  @override
  List<Object> get props => [message];
}

