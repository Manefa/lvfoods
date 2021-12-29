import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/data/datasources/create_restaurant_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/for_create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/repositories/add_restaurant_repository.dart';

class AddRestaurantRepositoryImpl implements AddRestaurantRepository{

  final AddRestaurantRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AddRestaurantRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, CreateRestaurant>> createRestaurant(ForCreateRestaurant createRestaurant) async {
    if (await networkInfo.isConnected){
      try{
        final remoteRestaurant = await remoteDataSource.createRestaurant(createRestaurant);
        return Right(remoteRestaurant);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}