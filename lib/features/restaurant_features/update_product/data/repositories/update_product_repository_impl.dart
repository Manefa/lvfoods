
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/data/datasources/update_product_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/for_update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/repositories/update_product_repository.dart';

class UpdateProductRepositoryImpl implements UpdateProductRepository{
  final UpdateProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UpdateProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, UpdateProduct>> updateProduct(ForUpdateProduct forUpdateProduct, String code) async {
    if (await networkInfo.isConnected){
      try{
        final remoteUpdateProduct = await remoteDataSource.updateProduct(forUpdateProduct, code);
        return Right(remoteUpdateProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}