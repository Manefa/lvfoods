import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/get_all_for_owner_restaurant/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/repositories/get_all_for_owner_restaurant_repository.dart';

class GetAllForOwnerRestaurantUseCase extends UseCaseGetAllForOwnerRestaurant<GetAllForOwnerRestaurant, Params>{
  final GetAllForOwnerRestaurantRepository repository;

  GetAllForOwnerRestaurantUseCase(this.repository);

  @override
  Future<Either<Failure, GetAllForOwnerRestaurant>> call(Params params) async {
    return await repository.getAllForOwnerRestaurantRepository(params.name);
  }
}

class Params extends Equatable{
  final String name;
  Params({required this.name});

  @override
  List<Object> get props => [name];
}