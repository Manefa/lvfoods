
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_product_details/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/repositories/get_product_details_repository.dart';

class GetProductDetailsUseCase extends UseCaseGetProductDetails<GetProductDetails, Params>{
  final GetProductDetailsRepository repository;

  GetProductDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, GetProductDetails>> call(Params params) async {
    return await repository.getProductDetails(params.code);
  }
}

class Params extends Equatable {
  final String code;

  Params({required this.code});

  @override
  List<Object> get props => [code];
}