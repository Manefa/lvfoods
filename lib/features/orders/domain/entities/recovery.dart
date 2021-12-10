import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/restaurant.dart';

class Recovery extends Equatable{
  final Restaurant? restaurant;
  final int? quantity;

  Recovery({
    required final this.restaurant,
    required final this.quantity,
  });


  Map<String, dynamic> toJson() => {
    "restaurant": restaurant!.toJson(),
    "quantity": quantity,
  };

  @override
  List<Object?> get props => [restaurant, quantity];
}