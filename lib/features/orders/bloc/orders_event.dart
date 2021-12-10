import 'package:equatable/equatable.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
}

class GetOrders extends OrdersEvent{

  @override
  String toString() {
    return "getOrdersEvent";
  }

  @override
  List<Object?> get props => ["getOrdersEvent"];
}
