
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/exception.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/platform/network_info.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/data/datasources/delete_product_remote_data_source.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/entities/product_delete_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/repositories/delete_product_repository.dart';

class DeleteProductRepositoryImpl implements DeleteProductRepository{
  final DeleteProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  DeleteProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, ProductDeleteMaster>> deleteProduct(String code) async {
    if (await networkInfo.isConnected){
      try{
        final remoteDeleteProduct = await remoteDataSource.deleteProduct(code);
        return Right(remoteDeleteProduct);
      } on ServerException {
        return Left(ServerFailure());
      }
    }else{
      return Left(ConnectionFailure());
    }
  }
}