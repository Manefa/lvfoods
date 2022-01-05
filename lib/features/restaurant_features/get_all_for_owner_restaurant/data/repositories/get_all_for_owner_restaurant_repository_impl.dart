import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/data/datasources/get_all_for_owner_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/repositories/get_all_for_owner_restaurant_repository.dart';

class GetAllForOwnerRestaurantRepositoryImpl implements GetAllForOwnerRestaurantRepository{
  final GetAllForOwnerRestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetAllForOwnerRestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetAllForOwnerRestaurant>> getAllForOwnerRestaurantRepository(String code) async {
    if (await networkInfo.isConnected){
      try{
        final takeDeliveryResponse = await remoteDataSource.getAllForOwnerRestaurant(code);
        return Right(takeDeliveryResponse);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}