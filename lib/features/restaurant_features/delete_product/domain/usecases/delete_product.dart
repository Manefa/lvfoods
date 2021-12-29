
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/delete_product/delete_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/entities/product_delete_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/repositories/delete_product_repository.dart';

class DeleteProductUseCase extends UseCaseDeleteProduct<ProductDeleteMaster, Params>{
  final DeleteProductRepository repository;

  DeleteProductUseCase(this.repository);

  @override
  Future<Either<Failure, ProductDeleteMaster>> call(Params params) async {
    return await repository.deleteProduct(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}