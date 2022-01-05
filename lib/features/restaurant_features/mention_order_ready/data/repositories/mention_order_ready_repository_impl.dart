
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/data/datasources/mention_order_ready_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/entities/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/repository/mention_order_ready_repository.dart';

class MentionOrderReadyRepositoryImpl implements MentionOrderReadyRepository{
  final MentionOrderReadyRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  MentionOrderReadyRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MentionOrderReady>> mentionOrderReady(String code) async {
    if (await networkInfo.isConnected){
      try{
        final startRecoveryResponse = await remoteDataSource.mentionOrderReady(code);
        return Right(startRecoveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}