
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/data/datasources/add_hours_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/for_add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/repository/add_hours_repository.dart';

class AddHoursRepositoryImpl implements AddHoursRepository{
  final AddHoursRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddHoursRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AddHours>> addHours(ForAddHours forAddHours, String name)async {
    if (await networkInfo.isConnected){
      try{
        final remoteDeleteHours = await remoteDataSource.addHours(forAddHours, name);
        return Right(remoteDeleteHours);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}