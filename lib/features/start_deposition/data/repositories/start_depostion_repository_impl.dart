import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/data/datasources/start_deposition_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/repositories/start_deposition_repository.dart';

class StartDepositionRepositoryImpl implements StartDepositionRepository{
  final StartDepositionRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  StartDepositionRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, StartDeposition>> updateStatusOrder(String code) async {
    if (await networkInfo.isConnected){
      try{
        final startDepositionResponse = await remoteDataSource.updateStatusOrder(code);
        return Right(startDepositionResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}