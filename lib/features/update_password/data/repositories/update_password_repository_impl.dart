
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/update_password/data/datasources/update_password_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/send_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/repositories/update_password_repository.dart';

class UpdatePasswordRepositoryImpl implements UpdatePasswordRepository{
  final UpdatePasswordRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UpdatePasswordRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UpdatePasswordMaster>> sendPassword(SendPassword sendPassword) async {
    if (await networkInfo.isConnected){
      try{
        final takeDeliveryResponse = await remoteDataSource.updatePassword(sendPassword);
        return Right(takeDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}