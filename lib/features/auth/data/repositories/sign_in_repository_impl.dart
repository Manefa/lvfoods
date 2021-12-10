import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/auth/data/datasources/sign_in_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_user.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/repositories/sign_in_repository.dart';

class SignInRepositoryImpl extends SignInRepository{
  final SignInRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SignInRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, SignInResponse>> login(SignInUser user) async {
    if (await networkInfo.isConnected){
      try{
        final signInResponse = await remoteDataSource.login(user);
        return Right(signInResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

}