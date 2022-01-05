import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';

abstract class GetAllForOwnerRestaurantRepository {
  Future<Either<Failure, GetAllForOwnerRestaurant>> getAllForOwnerRestaurantRepository(String code);
}