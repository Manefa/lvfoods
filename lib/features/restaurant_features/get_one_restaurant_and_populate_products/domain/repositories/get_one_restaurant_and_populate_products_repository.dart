import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';

abstract class GetOneRestaurantAndPopulateProductsRepository {
  Future<Either<Failure, GetOneRestaurantAndPopulateProducts>> getOneRestaurantAndPopulateProducts(String restaurantName);
}