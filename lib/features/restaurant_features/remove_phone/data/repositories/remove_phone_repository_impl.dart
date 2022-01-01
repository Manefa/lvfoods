
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/data/datasources/remove_phone_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/entities/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/repository/remove_phone_repository.dart';

class RemovePhoneRepositoryImpl implements RemovePhoneRepository{
  final RemovePhoneRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RemovePhoneRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, RemovePhone>> removePhone(String phone, String name) async{
    if (await networkInfo.isConnected){
      try{
        final remoteDeleteHone = await remoteDataSource.removePhone(phone, name);
        return Right(remoteDeleteHone);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}