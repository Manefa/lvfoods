import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/for_create_product.dart';

abstract class CreateProductRepository {
  Future<Either<Failure, CreateProduct>> createProduct(ForCreateProduct forCreateProduct);
}