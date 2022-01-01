
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/data/datasources/add_phone_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/for_add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/repository/add_phone_repository.dart';

class AddPhoneRepositoryImpl implements AddPhoneRepository{
  final AddPhoneRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddPhoneRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AddPhone>> addPhone(ForAddPhone forAddPhone, String name) async {
    if (await networkInfo.isConnected){
      try{
        final remoteDeletePhone = await remoteDataSource.addPhone(forAddPhone, name);
        return Right(remoteDeletePhone);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}