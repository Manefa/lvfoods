import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/datasources/get_user_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_user/data/datasources/get_user_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user_master.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/repositories/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository{

  final GetUserRemoteDataSource remoteDataSource;
  final GetUserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetUserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, UserMaster>> getUser() async {
    if (await networkInfo.isConnected){
      try{
        final remoteUser = await remoteDataSource.getUser();
        localDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try{
        final localUser = await localDataSource.getCacheUser();
        return Right(localUser);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}