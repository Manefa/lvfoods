import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_country/get_country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/repositories/get_country_repository.dart';

class GetCountryUseCase extends UseCaseGetCountry<CountryMaster, NoParams>{
  final GetCountryRepository repository;

  GetCountryUseCase(this.repository);

  @override
  Future<Either<Failure, CountryMaster>> call(NoParams params) async {
    return await repository.getCountry();
  }
}