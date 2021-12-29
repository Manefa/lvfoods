
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/update_product.dart';

abstract class UpdateProductState extends Equatable {
  const UpdateProductState();
}

class UpdateProductEmpty extends UpdateProductState {
  @override
  List<Object> get props => [];
}

class UpdateProductLoading extends UpdateProductState {
  @override
  List<Object> get props => [];
}

class UpdateProductLoaded extends UpdateProductState {
  final UpdateProduct updateProduct;

  UpdateProductLoaded({required this.updateProduct});
  @override
  List<Object> get props => [updateProduct];
}

class UpdateProductError extends UpdateProductState {
  final String message;

  UpdateProductError({required this.message});
  @override
  List<Object> get props => [message];
}
