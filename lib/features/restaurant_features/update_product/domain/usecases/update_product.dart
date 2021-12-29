import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/update_product/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/for_update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/update_product.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/repositories/update_product_repository.dart';

class UpdateProductUseCase extends UseCaseUpdateProduct<UpdateProduct, Params>{
  final UpdateProductRepository repository;

  UpdateProductUseCase(this.repository);

  @override
  Future<Either<Failure, UpdateProduct>> call(Params params) async {
    return await repository.updateProduct(params.forUpdateProduct, params.code);
  }
}

class Params extends Equatable {
  final ForUpdateProduct forUpdateProduct;
  final String code;

  Params({required this.forUpdateProduct, required this.code});

  @override
  List<Object> get props => [forUpdateProduct, code];
}