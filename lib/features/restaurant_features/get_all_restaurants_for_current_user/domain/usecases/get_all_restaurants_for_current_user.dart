
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_all_restaurants_for_current_user/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/repositories/get_all_restaurants_for_current_user_repository.dart';

class GetAllRestaurantsForCurrentUserUseCase extends UseCaseGetAllRestaurantsForCurrentUser<GetAllRestaurantsForCurrentUser, NoParams>{
  final GetAllRestaurantsForCurrentUserRepository repository;

  GetAllRestaurantsForCurrentUserUseCase(this.repository);

  @override
  Future<Either<Failure, GetAllRestaurantsForCurrentUser>> call(NoParams params) async {
    return await repository.getAllRestaurantsForCurrentUser();
  }
}