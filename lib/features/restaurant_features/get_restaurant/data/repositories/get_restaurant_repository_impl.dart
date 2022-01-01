

import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/data/datasources/get_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/repository/get_restaurant_repository.dart';

class GetRestaurantRepositoryImpl implements GetRestaurantRepository{
  final GetRestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetRestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetRestaurant>> getRestaurant(String name) async {
    if (await networkInfo.isConnected){
      try{
        final takeDeliveryResponse = await remoteDataSource.getRestaurant(name);
        return Right(takeDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}