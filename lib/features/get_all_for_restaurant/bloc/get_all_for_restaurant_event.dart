import 'package:equatable/equatable.dart';

abstract class GetAllForRestaurantEvent extends Equatable {
  const GetAllForRestaurantEvent();
}
class GetGetAllForRestaurantEvent extends GetAllForRestaurantEvent{
  final String restaurantName;

  GetGetAllForRestaurantEvent({required this.restaurantName});
  @override
  List<Object?> get props => [restaurantName];
}
