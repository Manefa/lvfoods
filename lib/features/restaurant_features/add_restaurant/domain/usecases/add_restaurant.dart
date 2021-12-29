import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/add_restaurant/add_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/for_create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/repositories/add_restaurant_repository.dart';

class AddRestaurantUseCase extends UseCaseAddRestaurant<CreateRestaurant, Params>{
  final AddRestaurantRepository repository;

  AddRestaurantUseCase(this.repository);

  @override
  Future<Either<Failure, CreateRestaurant>> call(Params params) async {
    return await repository.createRestaurant(params.createRestaurant);
  }
}

class Params extends Equatable {
  final ForCreateRestaurant createRestaurant;

  Params({required this.createRestaurant});

  @override
  List<Object> get props => [createRestaurant];
}