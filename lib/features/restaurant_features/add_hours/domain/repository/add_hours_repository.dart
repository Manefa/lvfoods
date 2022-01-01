
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';

abstract class AddHoursRepository {
  Future<Either<Failure, AddHours>> addHours(ForAddHours forAddHours, String name);
}