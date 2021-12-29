
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/data/datasources/create_product_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/for_create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/repositories/create_product_repository.dart';

class CreateProductRepositoryImpl implements CreateProductRepository{
  final CreateProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CreateProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, CreateProduct>> createProduct(ForCreateProduct forCreateProduct) async {
    if (await networkInfo.isConnected){
      try{
        final remoteCreateProduct = await remoteDataSource.createProduct(forCreateProduct);
        return Right(remoteCreateProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}