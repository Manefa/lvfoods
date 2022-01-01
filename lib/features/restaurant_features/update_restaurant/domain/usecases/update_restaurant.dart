
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/edit_restaurant/edit_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/for_update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/repositories/update_restaurant_repository.dart';

class UpdateRestaurantUseCase extends UseCaseUpdateRestaurant<UpdateRestaurant, Params>{
  final UpdateRestaurantRepository repository;

  UpdateRestaurantUseCase(this.repository);

  @override
  Future<Either<Failure, UpdateRestaurant>> call(Params params) async {
    return await repository.updateRestaurant(params.createRestaurant, params.name);
  }
}

class Params extends Equatable {
  final ForUpdateRestaurant createRestaurant;
  final String name;

  Params({required this.createRestaurant, required this.name});

  @override
  List<Object> get props => [createRestaurant];
}