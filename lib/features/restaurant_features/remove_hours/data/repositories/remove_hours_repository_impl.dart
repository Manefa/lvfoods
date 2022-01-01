

import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/data/datasources/remove_hours_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/entities/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/repository/remove_hours_repository.dart';

class RemoveHoursRepositoryImpl implements RemoveHoursRepository{
  final RemoveHoursRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RemoveHoursRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RemoveHours>> removeHours(String hours, String name) async{
    if (await networkInfo.isConnected){
      try{
        final remoteDeleteHours = await remoteDataSource.removeHours(hours, name);
        return Right(remoteDeleteHours);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}