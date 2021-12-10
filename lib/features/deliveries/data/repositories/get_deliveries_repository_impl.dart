import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/deliveries/data/datasources/get_deliveries_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/deliveries/data/datasources/get_deliveries_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/repositories/get_deliveries_repository.dart';

class GetDeliveriesRepositoryImpl implements GetDeliveriesRepository{

  final GetDeliveriesRemoteDataSource remoteDataSource;
  final GetDeliveriesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetDeliveriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, DeliveriesMasters>> getDeliveries() async {
    if (await networkInfo.isConnected){
      try{
        final remoteDeliveries = await remoteDataSource.getDeliveries();
        localDataSource.cacheDeliveries(remoteDeliveries);
        return Right(remoteDeliveries);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try{
        final localDeliveries = await localDataSource.getLastDeliveries();
        return Right(localDeliveries);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}