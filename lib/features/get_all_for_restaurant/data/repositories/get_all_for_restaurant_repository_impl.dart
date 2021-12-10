import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/data/datasources/get_all_for_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/repositories/get_all_for_restaurant_repository.dart';

class GetAllForRestaurantRepositoryImpl implements GetAllForRestaurantRepository{

  final GetAllForRestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetAllForRestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetAllForRestaurant>> getAllForRestaurant(String restaurantName) async {
    if(await networkInfo.isConnected){
      try{
        final getAllForRestaurant = await remoteDataSource.getAllForRestaurant(restaurantName);
        return Right(getAllForRestaurant);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}