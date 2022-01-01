import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/entities/remove_phone.dart';

abstract class RemovePhoneRepository {
  Future<Either<Failure, RemovePhone>> removePhone(String phone, String name);
}