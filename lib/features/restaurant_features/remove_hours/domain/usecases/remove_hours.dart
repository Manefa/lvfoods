
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/remove_hours/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/entities/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/repository/remove_hours_repository.dart';

class RemoveHoursUseCase extends UseCaseRemoveHours<RemoveHours, Params>{
  final RemoveHoursRepository repository;

  RemoveHoursUseCase(this.repository);

  @override
  Future<Either<Failure, RemoveHours>> call(Params params) async {
    return await repository.removeHours(params.hours, params.name);
  }
}

class Params extends Equatable {
  final String hours;
  final String name;

  Params({required this.name, required this.hours});

  @override
  List<Object> get props => [hours, name];
}