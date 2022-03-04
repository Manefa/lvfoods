import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country_master.dart';

abstract class GetCountryRepository {
  Future<Either<Failure, CountryMaster>> getCountry();
}