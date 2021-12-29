import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/get_all_restaurants_for_current_user.dart';

abstract class GetAllRestaurantsForCurrentUserRepository {
  Future<Either<Failure, GetAllRestaurantsForCurrentUser>> getAllRestaurantsForCurrentUser();
}