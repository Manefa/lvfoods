import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/data/datasources/on_the_way_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/entities/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/repositories/on_the_way_repository.dart';

class OnTheWayRepositoryImpl implements OnTheWayRepository{
  final OnTheWayRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OnTheWayRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, OnTheWay>> inProgressDelivery(String code) async {
    if (await networkInfo.isConnected){
      try{
        final onTheWayResponse = await remoteDataSource.inProgressDelivery(code);
        return Right(onTheWayResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}