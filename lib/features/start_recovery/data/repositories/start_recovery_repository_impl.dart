import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/data/datasources/start_recovery_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/repository/start_recovery_repository.dart';

class StartRecoveryRepositoryImpl implements StartRecoveryRepository{
  final StartRecoveryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  StartRecoveryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, StartRecovery>> updateStatusOrder(String code) async {
    if (await networkInfo.isConnected){
      try{
        final startRecoveryResponse = await remoteDataSource.updateStatusOrder(code);
        return Right(startRecoveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}