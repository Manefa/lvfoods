import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/data/datasources/get_one_for_deliver_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/repositories/get_one_for_deliver_repository.dart';

class GetOneForDeliverRepositoryImpl implements GetOneForDeliverRepository{

  final GetOneForDeliverRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetOneForDeliverRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetOneForDeliver>> getOneForDeliver(String code) async {
    if(await networkInfo.isConnected){
      try{
        final getOneForDeliver = await remoteDataSource.getOneForDeliver(code);
        return Right(getOneForDeliver);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}