import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city_master.dart';

abstract class GetCityRepository {
  Future<Either<Failure, CityMaster>> getCity();
}