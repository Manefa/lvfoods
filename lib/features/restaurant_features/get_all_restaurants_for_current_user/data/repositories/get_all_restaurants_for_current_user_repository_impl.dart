import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/datasources/get_all_restaurants_for_current_user_local_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/data/datasources/get_all_restaurants_for_current_user_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/entities/get_all_restaurants_for_current_user.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_restaurants_for_current_user/domain/repositories/get_all_restaurants_for_current_user_repository.dart';

class GetAllRestaurantsForCurrentUserRepositoryImpl implements GetAllRestaurantsForCurrentUserRepository{
  final GetAllRestaurantsForCurrentUserRemoteDataSource remoteDataSource;
  final GetAllRestaurantsForCurrentUserLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GetAllRestaurantsForCurrentUserRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, GetAllRestaurantsForCurrentUser>> getAllRestaurantsForCurrentUser() async {
    if (await networkInfo.isConnected){
      try{
        final remoteRestaurants = await remoteDataSource.getAllRestaurantsForCurrentUser();
        localDataSource.cacheRestaurants(remoteRestaurants);
        return Right(remoteRestaurants);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      try{
        final localRestaurants = await localDataSource.getLastRestaurants();
        return Right(localRestaurants);
      }on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}