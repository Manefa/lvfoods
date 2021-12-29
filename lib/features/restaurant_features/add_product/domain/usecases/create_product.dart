import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/add_product/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/for_create_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/repositories/create_product_repository.dart';

class CreateProductUseCase extends UseCaseCreateProduct<CreateProduct, Params>{
  final CreateProductRepository repository;

  CreateProductUseCase(this.repository);

  @override
  Future<Either<Failure, CreateProduct>> call(Params params) async {
    return await repository.createProduct(params.forCreateProduct);
  }
}

class Params extends Equatable {
  final ForCreateProduct forCreateProduct;

  Params({required this.forCreateProduct,});

  @override
  List<Object> get props => [forCreateProduct];
}