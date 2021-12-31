
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_categories/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/get_categories_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/repositories/get_categories_repository.dart';

class GetCategoriesUseCase extends UseCaseGetCategories<GetCategoriesMaster, NoParams>{
  final GetCategoriesRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, GetCategoriesMaster>> call(NoParams params) async {
    return await repository.getCategories();
  }
}