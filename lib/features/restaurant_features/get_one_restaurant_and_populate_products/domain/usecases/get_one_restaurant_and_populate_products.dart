import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_one_restaurant_and_populate_products/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/repositories/get_one_restaurant_and_populate_products_repository.dart';

class GetOneRestaurantAndPopulateProductsUseCase extends UseCaseGetOneRestaurantAndPopulateProducts<GetOneRestaurantAndPopulateProducts, Params>{
  final GetOneRestaurantAndPopulateProductsRepository repository;

  GetOneRestaurantAndPopulateProductsUseCase(this.repository);

  @override
  Future<Either<Failure, GetOneRestaurantAndPopulateProducts>> call(Params params) async {
    return await repository.getOneRestaurantAndPopulateProducts(params.restaurantName);
  }
}

class Params extends Equatable {
  final String restaurantName;

  Params({required this.restaurantName});

  @override
  List<Object> get props => [restaurantName];
}