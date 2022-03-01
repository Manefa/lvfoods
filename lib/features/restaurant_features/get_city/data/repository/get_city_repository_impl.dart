
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/data/datasources/get_city_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/repositories/get_city_repository.dart';

class GetCityRepositoryImpl implements GetCityRepository{
  final GetCityRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetCityRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CityMaster>> getCity() async {
    if (await networkInfo.isConnected){
      try{
        final remoteStyles = await remoteDataSource.getCity();
        return Right(remoteStyles);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}