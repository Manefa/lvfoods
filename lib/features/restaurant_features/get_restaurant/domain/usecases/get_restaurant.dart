
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_restaurant/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/repository/get_restaurant_repository.dart';

class GetRestaurantUseCase extends UseCaseGetRestaurant<GetRestaurant, Params>{
  final GetRestaurantRepository repository;

  GetRestaurantUseCase(this.repository);

  @override
  Future<Either<Failure, GetRestaurant>> call(Params params) async {
    return await repository.getRestaurant(params.name);
  }
}

class Params extends Equatable {
  final String name;

  Params({required this.name});

  @override
  List<Object> get props => [name];
}