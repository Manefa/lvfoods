import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/product.dart';

class Order extends Equatable{
  final Product? item;
  final int? quantity;
  final String? statusPayment;
  final String? status;

  Order({
     required this.item,
     required this.quantity,
    required this.statusPayment,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    "item": item == null ? null : item!.toJson(),
    "quantity": quantity == null ? null : quantity,
  };

  @override
  List<Object?> get props => [item, quantity, statusPayment, status];
}