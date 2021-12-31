
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/data/datasources/get_categories_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/get_categories_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/repositories/get_categories_repository.dart';

class GetCategoriesRepositoryImpl implements GetCategoriesRepository{
  final GetCategoriesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetCategoriesRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, GetCategoriesMaster>> getCategories() async {
    if (await networkInfo.isConnected){
      try{
        final remoteCategories = await remoteDataSource.getCategories();
        return Right(remoteCategories);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }

}