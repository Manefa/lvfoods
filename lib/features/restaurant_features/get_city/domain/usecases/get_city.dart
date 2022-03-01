import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_city/get_city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/repositories/get_city_repository.dart';

class GetCityUseCase extends UseCaseGetCity<CityMaster, NoParams>{
  final GetCityRepository repository;

  GetCityUseCase(this.repository);

  @override
  Future<Either<Failure, CityMaster>> call(NoParams params) async {
    return await repository.getCity();
  }
}