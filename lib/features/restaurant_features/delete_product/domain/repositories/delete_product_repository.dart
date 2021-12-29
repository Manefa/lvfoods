import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/entities/product_delete_master.dart';

abstract class DeleteProductRepository {
  Future<Either<Failure, ProductDeleteMaster>> deleteProduct(String code);
}