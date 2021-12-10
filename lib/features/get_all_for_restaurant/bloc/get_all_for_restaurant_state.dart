import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/get_all_for_restaurant.dart';

abstract class GetAllForRestaurantState extends Equatable {
  const GetAllForRestaurantState();
}

class EmptyGetAllForRestaurant extends GetAllForRestaurantState {
  @override
  List<Object> get props => [];
}

class LoadingGetAllForRestaurant extends GetAllForRestaurantState {
  @override
  List<Object> get props => [];
}

class LoadedGetAllForRestaurant extends GetAllForRestaurantState {
  final GetAllForRestaurant getAllForRestaurant;

  LoadedGetAllForRestaurant({required this.getAllForRestaurant});
  @override
  List<Object> get props => [];
}

class ErrorGetAllForRestaurant extends GetAllForRestaurantState {
  final String message;

  ErrorGetAllForRestaurant({required this.message});
  @override
  List<Object> get props => [];
}
