


import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/data/datasources/get_country_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/repositories/get_country_repository.dart';

class GetCountryRepositoryImpl implements GetCountryRepository{
  final GetCountryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetCountryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CountryMaster>> getCountry() async {
    if (await networkInfo.isConnected){
      try{
        final remoteStyles = await remoteDataSource.getCountry();
        return Right(remoteStyles);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}