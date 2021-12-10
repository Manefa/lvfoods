
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/data/datasources/take_delivery_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/repositories/take_delivery_repository.dart';

class TakeDeliveryRepositoryImpl implements TakeDeliveryRepository{
  final TakeDeliveryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  TakeDeliveryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TakeDeliveryMaster>> takeDelivery(String code) async {
    if (await networkInfo.isConnected){
      try{
        final takeDeliveryResponse = await remoteDataSource.takeDelivery(code);
        return Right(takeDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}