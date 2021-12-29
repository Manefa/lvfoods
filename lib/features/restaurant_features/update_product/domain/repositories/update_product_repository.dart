
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/for_update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/update_product.dart';

abstract class UpdateProductRepository {
  Future<Either<Failure, UpdateProduct>> updateProduct(ForUpdateProduct forUpdateProduct, String code);
}