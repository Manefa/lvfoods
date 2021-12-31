import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/data/datasources/get_styles_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/get_styles_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/repositories/get_styles_repository.dart';

class GetStylesRepositoryImpl implements GetStylesRepository{
  final GetStylesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetStylesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetStylesMaster>> getStyles() async {
    if (await networkInfo.isConnected){
      try{
        final remoteStyles = await remoteDataSource.getStyles();
        return Right(remoteStyles);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

}