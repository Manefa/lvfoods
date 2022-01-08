import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/delivered/data/datasources/delivered_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/entities/delivered.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/repositories/delivered_repository.dart';

class DeliveredRepositoryImpl implements DeliveredRepository{
  final DeliveredRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DeliveredRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Delivered>> deliveredDelivery(String code,) async {
    if (await networkInfo.isConnected){
      try{
        final paidDeliveryResponse = await remoteDataSource.deliveredDelivery(code);
        return Right(paidDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}