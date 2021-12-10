import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/orders_masters.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class EmptyOrders extends OrdersState {
  @override
  List<Object> get props => ["Empty"];
}

class LoadingOrders extends OrdersState {
  @override
  List<Object> get props => ["Loading"];
}

class LoadedOrders extends OrdersState {
  final OrdersMasters ordersMasters;

  LoadedOrders({required this.ordersMasters});
  @override
  List<Object> get props => [ordersMasters, "Loaded"];
}

class ErrorOrders extends OrdersState {
  final String message;

  ErrorOrders({required this.message});
  @override
  List<Object> get props => [message, "Error"];
}
