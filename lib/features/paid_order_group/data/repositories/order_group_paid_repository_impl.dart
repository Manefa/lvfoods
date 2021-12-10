
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/data/datasources/order_group_paid_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/repositories/order_group_paid_repository.dart';

class OrderGroupPaidRepositoryImpl implements OrderGroupPaidRepository{
  final OrderGroupPaidRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OrderGroupPaidRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OrderGroupPaid>> paidOrderGroup(String code) async {
    if (await networkInfo.isConnected){
      try{
        final paidDeliveryResponse = await remoteDataSource.paidOrderGroup(code);
        return Right(paidDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}