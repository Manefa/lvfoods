import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/datasources/get_product_details_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/data/datasources/get_product_details_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/repositories/get_product_details_repository.dart';

class GetProductDetailsRepositoryImpl implements GetProductDetailsRepository{
  final GetProductDetailsRemoteDataSource remoteDataSource;
  final GetProductDetailsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetProductDetailsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetProductDetails>> getProductDetails(String code) async {
    if (await networkInfo.isConnected){
      try{
        final remoteProductDetails = await remoteDataSource.getProductDetails(code);
        localDataSource.cacheProductDetails(remoteProductDetails, code);
        return Right(remoteProductDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try{
        final localProductDetails = await localDataSource.getProductDetails(code);
        return Right(localProductDetails);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}