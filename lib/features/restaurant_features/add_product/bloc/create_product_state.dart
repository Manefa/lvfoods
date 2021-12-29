
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/create_product.dart';

abstract class CreateProductState extends Equatable {
  const CreateProductState();
}

class CreateProductEmpty extends CreateProductState {
  @override
  List<Object> get props => [];
}

class CreateProductLoading extends CreateProductState {
  @override
  List<Object> get props => [];
}

class CreateProductLoaded extends CreateProductState {
  final CreateProduct createProduct;

  CreateProductLoaded({required this.createProduct});
  @override
  List<Object> get props => [createProduct];
}

class CreateProductError extends CreateProductState {
  final String message;

  CreateProductError({required this.message});
  @override
  List<Object> get props => [message];
}
