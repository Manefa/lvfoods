import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/get_all_for_restaurant.dart';

abstract class GetAllForRestaurantRepository {
  Future<Either<Failure, GetAllForRestaurant>> getAllForRestaurant(String restaurantName);
}