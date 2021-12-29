
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_product/domain/entities/for_update_product.dart';

abstract class UpdateProductEvent extends Equatable {
  const UpdateProductEvent();
}

class StartUpdateProduct extends UpdateProductEvent{
  final ForUpdateProduct forUpdateProduct;
  final String code;

  StartUpdateProduct({required this.forUpdateProduct,required this.code});

  @override
  List<Object?> get props => [forUpdateProduct, code];
}