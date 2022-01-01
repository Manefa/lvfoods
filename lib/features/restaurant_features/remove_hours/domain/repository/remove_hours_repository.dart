import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/entities/remove_hours.dart';

abstract class RemoveHoursRepository {
  Future<Either<Failure, RemoveHours>> removeHours(String hours, String name);
}