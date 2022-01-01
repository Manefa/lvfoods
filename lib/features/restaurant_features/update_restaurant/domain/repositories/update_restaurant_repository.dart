
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/for_update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/update_restaurant.dart';

abstract class UpdateRestaurantRepository {
  Future<Either<Failure, UpdateRestaurant>> updateRestaurant(ForUpdateRestaurant createRestaurant, String name);
}