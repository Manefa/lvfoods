
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/for_add_phone.dart';

abstract class AddPhoneRepository {
  Future<Either<Failure, AddPhone>> addPhone(ForAddPhone forAddPhone, String name);
}