import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/for_create_restaurant.dart';

abstract class AddRestaurantRepository {
  Future<Either<Failure, CreateRestaurant>> createRestaurant(ForCreateRestaurant createRestaurant);
}