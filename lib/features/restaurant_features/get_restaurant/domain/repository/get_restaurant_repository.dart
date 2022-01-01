
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';

abstract class GetRestaurantRepository {
  Future<Either<Failure, GetRestaurant>> getRestaurant(String name);
}