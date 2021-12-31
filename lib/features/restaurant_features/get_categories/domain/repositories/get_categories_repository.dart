
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/get_categories_master.dart';

abstract class GetCategoriesRepository {
  Future<Either<Failure, GetCategoriesMaster>> getCategories();
}