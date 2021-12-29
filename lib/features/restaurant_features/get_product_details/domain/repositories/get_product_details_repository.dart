
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';

abstract class GetProductDetailsRepository {
  Future<Either<Failure, GetProductDetails>> getProductDetails(String code);
}