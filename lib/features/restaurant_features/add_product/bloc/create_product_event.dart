
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_product/domain/entities/for_create_product.dart';

abstract class CreateProductEvent extends Equatable {
  const CreateProductEvent();
}

class StartCreateProduct extends CreateProductEvent{
  final ForCreateProduct forCreateProduct;

  StartCreateProduct({required this.forCreateProduct});
  @override
  List<Object?> get props => [forCreateProduct];
}