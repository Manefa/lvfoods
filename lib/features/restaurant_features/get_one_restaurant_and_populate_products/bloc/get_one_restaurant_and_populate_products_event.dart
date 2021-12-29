import 'package:equatable/equatable.dart';

abstract class GetOneRestaurantAndPopulateProductsEvent extends Equatable {
  const GetOneRestaurantAndPopulateProductsEvent();
}

class StartGetOneRestaurantAndPopulateProducts extends GetOneRestaurantAndPopulateProductsEvent{
  final String restaurantName;

  StartGetOneRestaurantAndPopulateProducts({required this.restaurantName});
  @override
  List<Object?> get props => [restaurantName];
}
