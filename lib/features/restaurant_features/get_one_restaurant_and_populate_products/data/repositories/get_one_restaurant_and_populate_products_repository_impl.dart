import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/datasources/get_one_restaurant_and_populate_products_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/data/datasources/get_one_restaurant_and_populate_products_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/repositories/get_one_restaurant_and_populate_products_repository.dart';

class GetOneRestaurantAndPopulateProductsRepositoryImpl implements GetOneRestaurantAndPopulateProductsRepository{
  final GetOneRestaurantAndPopulateProductsRemoteDataSource remoteDataSource;
  final GetOneRestaurantAndPopulateProductsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetOneRestaurantAndPopulateProductsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, GetOneRestaurantAndPopulateProducts>> getOneRestaurantAndPopulateProducts(String restaurantName) async {
    if (await networkInfo.isConnected){
      try{
        final remoteProducts = await remoteDataSource.getOneRestaurantAndPopulateProducts(restaurantName);
        localDataSource.cacheProducts(remoteProducts);
        return Right(remoteProducts);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try{
        final localProducts = await localDataSource.getProducts();
        return Right(localProducts);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}