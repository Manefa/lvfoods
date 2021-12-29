
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';

abstract class GetProductDetailsState extends Equatable {
  const GetProductDetailsState();
}

class GetProductDetailsEmpty extends GetProductDetailsState {
  @override
  List<Object> get props => [];
}

class GetProductDetailsLoading extends GetProductDetailsState {
  @override
  List<Object> get props => [];
}

class GetProductDetailsLoaded extends GetProductDetailsState {
  final GetProductDetails getProductDetails;

  GetProductDetailsLoaded({required this.getProductDetails});
  @override
  List<Object> get props => [getProductDetails];
}

class GetProductDetailsError extends GetProductDetailsState {
  final String message;

  GetProductDetailsError({required this.message});
  @override
  List<Object> get props => [message];
}
