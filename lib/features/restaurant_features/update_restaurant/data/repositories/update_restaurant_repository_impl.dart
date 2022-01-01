
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/data/datasources/update_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/for_update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/repositories/update_restaurant_repository.dart';

class UpdateRestaurantRepositoryImpl implements UpdateRestaurantRepository{

  final UpdateRestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UpdateRestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, UpdateRestaurant>> updateRestaurant(ForUpdateRestaurant updateRestaurant, String name) async {
    if (await networkInfo.isConnected){
      try{
        final remoteRestaurant = await remoteDataSource.updateRestaurant(updateRestaurant, name);
        return Right(remoteRestaurant);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}