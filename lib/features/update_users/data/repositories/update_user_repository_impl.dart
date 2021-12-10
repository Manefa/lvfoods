import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/update_users/data/datasources/update_user_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_for_update.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/repositories/update_user_repository.dart';

class UpdateUserRepositoryImpl implements UpdateUserRepository{

  final UpdateUserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UpdateUserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, UserMaster>> updateUser(UserForUpdate userMaster) async {
    if (await networkInfo.isConnected){
      try{
        final remoteUser = await remoteDataSource.updateUser(userMaster);
        return Right(remoteUser);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(CacheFailure());
    }
  }
}