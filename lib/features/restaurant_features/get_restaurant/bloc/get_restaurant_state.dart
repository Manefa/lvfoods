
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';

abstract class GetRestaurantState extends Equatable {
  const GetRestaurantState();
}

class GetRestaurantEmpty extends GetRestaurantState {
  @override
  List<Object> get props => [];
}

class GetRestaurantLoading extends GetRestaurantState {
  @override
  List<Object> get props => [];
}

class GetRestaurantLoaded extends GetRestaurantState {
  final GetRestaurant getRestaurant;

  GetRestaurantLoaded({required this.getRestaurant});
  @override
  List<Object> get props => [getRestaurant];
}

class GetRestaurantError extends GetRestaurantState {
  final String message;

  GetRestaurantError({required this.message});
  @override
  List<Object> get props => [message];
}
