import 'package:equatable/equatable.dart';

abstract class TakeDeliveryEvent extends Equatable {
  const TakeDeliveryEvent();
}

class TakeDelivery extends TakeDeliveryEvent{
  final String code;

  TakeDelivery({required this.code});

  @override
  List<Object?> get props => [code];
}