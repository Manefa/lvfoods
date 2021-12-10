import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/orders/data/datasources/get_orders_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/orders/data/datasources/get_orders_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/orders_masters.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/repositories/get_orders_repository.dart';

class GetOrdersRepositoryImpl implements GetOrdersRepository{
  final GetOrdersRemoteDataSource remoteDataSource;
  final GetOrdersLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetOrdersRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, OrdersMasters>> getOrders() async {
    if (await networkInfo.isConnected){
      try{
        final remoteDeliveries = await remoteDataSource.getOrders();
        localDataSource.cacheOrders(remoteDeliveries);
        return Right(remoteDeliveries);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try{
        final localOrders = await localDataSource.getLastOrders();
        return Right(localOrders);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}