
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/delete_product/domain/entities/product_delete_master.dart';

abstract class DeleteProductState extends Equatable {
  const DeleteProductState();
}

class DeleteProductEmpty extends DeleteProductState {

  @override
  List<Object> get props => [];
}

class DeleteProductLoading extends DeleteProductState {

  @override
  List<Object> get props => [];
}

class DeleteProductLoaded extends DeleteProductState {
  final ProductDeleteMaster productDeleteMaster;

  DeleteProductLoaded({required this.productDeleteMaster});
  @override
  List<Object> get props => [productDeleteMaster];
}

class DeleteProductError extends DeleteProductState {
  final String message;

  DeleteProductError({required this.message});
  @override
  List<Object> get props => [message];
}
