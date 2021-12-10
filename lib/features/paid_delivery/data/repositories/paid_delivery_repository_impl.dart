import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/data/datasources/paid_delivery_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/repositories/paid_delivery_repository.dart';

class PaidDeliveryRepositoryImpl implements PaidDeliveryRepository{
  final PaidDeliveryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PaidDeliveryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PaidDeliveryMaster>> paidDelivery(String code) async {
    if (await networkInfo.isConnected){
      try{
        final paidDeliveryResponse = await remoteDataSource.paidDelivery(code);
        return Right(paidDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}