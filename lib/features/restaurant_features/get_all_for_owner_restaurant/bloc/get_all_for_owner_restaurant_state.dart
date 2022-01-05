
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';

abstract class GetAllForOwnerRestaurantState extends Equatable {
  const GetAllForOwnerRestaurantState();
}

class GetAllForOwnerRestaurantEmpty extends GetAllForOwnerRestaurantState {
  @override
  List<Object> get props => [];
}

class GetAllForOwnerRestaurantLoading extends GetAllForOwnerRestaurantState {
  @override
  List<Object> get props => [];
}

class GetAllForOwnerRestaurantLoaded extends GetAllForOwnerRestaurantState {
  final GetAllForOwnerRestaurant getAllForOwnerRestaurant;

  GetAllForOwnerRestaurantLoaded({required this.getAllForOwnerRestaurant});
  @override
  List<Object> get props => [getAllForOwnerRestaurant];
}

class GetAllForOwnerRestaurantError extends GetAllForOwnerRestaurantState {
  final String message;

  GetAllForOwnerRestaurantError({required this.message});
  @override
  List<Object> get props => [message];
}
