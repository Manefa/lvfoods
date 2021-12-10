import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/get_all_for_restaurant/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/repositories/get_all_for_restaurant_repository.dart';

class GetAllForRestaurantUseCase extends UseCaseGetForAllRestaurant<GetAllForRestaurant, Params>{
  final GetAllForRestaurantRepository repository;

  GetAllForRestaurantUseCase(this.repository);

  @override
  Future<Either<Failure, GetAllForRestaurant>> call(Params params) async {
    return await repository.getAllForRestaurant(params.restaurantName);
  }
}

class Params extends Equatable {
  final String restaurantName;

  Params({required this.restaurantName});

  @override
  List<Object?> get props => [restaurantName];
}