
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/update_restaurant.dart';

abstract class UpdateRestaurantState extends Equatable {
  const UpdateRestaurantState();
}

class UpdateRestaurantEmpty extends UpdateRestaurantState {
  @override
  List<Object> get props => [];
}

class UpdateRestaurantLoading extends UpdateRestaurantState {
  @override
  List<Object> get props => [];
}

class UpdateRestaurantLoaded extends UpdateRestaurantState {
  final UpdateRestaurant updateRestaurant;

  UpdateRestaurantLoaded({required this.updateRestaurant});
  @override
  List<Object> get props => [updateRestaurant];
}

class UpdateRestaurantError extends UpdateRestaurantState {
  final String message;

  UpdateRestaurantError({required this.message});
  @override
  List<Object> get props => [message];
}

