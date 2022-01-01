
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/add_hours/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/repository/add_hours_repository.dart';

class AddHoursUseCase extends UseCaseAddHours<AddHours, Params>{
  final AddHoursRepository repository;

  AddHoursUseCase(this.repository);

  @override
  Future<Either<Failure, AddHours>> call(Params params) async {
    return await repository.addHours(params.addHours, params.name);
  }
}

class Params extends Equatable {
  final ForAddHours addHours;
  final String name;

  Params({required this.name, required this.addHours});
  @override
  List<Object> get props => [name];
}