import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/deposited/data/datasources/deposited_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/repositories/deposited_repository.dart';

class DepositedRepositoryImpl implements DepositedRepository{
  final DepositedRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DepositedRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Deposited>> updateStatusOrder(String code) async {
    if (await networkInfo.isConnected){
      try{
        final depositedResponse = await remoteDataSource.updateStatusOrder(code);
        return Right(depositedResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}