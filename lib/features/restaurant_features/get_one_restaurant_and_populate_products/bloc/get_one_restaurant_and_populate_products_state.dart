import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';

abstract class GetOneRestaurantAndPopulateProductsState extends Equatable {
  const GetOneRestaurantAndPopulateProductsState();
}

class GetOneRestaurantAndPopulateProductsEmpty extends GetOneRestaurantAndPopulateProductsState {
  @override
  List<Object> get props => [];
}

class GetOneRestaurantAndPopulateProductsLoading extends GetOneRestaurantAndPopulateProductsState {
  @override
  List<Object> get props => [];
}

class GetOneRestaurantAndPopulateProductsLoaded extends GetOneRestaurantAndPopulateProductsState {
  final GetOneRestaurantAndPopulateProducts getOneRestaurantAndPopulateProducts;

  GetOneRestaurantAndPopulateProductsLoaded({required this.getOneRestaurantAndPopulateProducts});
  @override
  List<Object> get props => [getOneRestaurantAndPopulateProducts];
}

class GetOneRestaurantAndPopulateProductsError extends GetOneRestaurantAndPopulateProductsState {
  final String message;

  GetOneRestaurantAndPopulateProductsError({required this.message});
  @override
  List<Object> get props => [message];
}
