import 'package:equatable/equatable.dart';

abstract class DeliveredEvent extends Equatable {
  const DeliveredEvent();
}

class MakeDelivered extends DeliveredEvent{
  final String code;

  MakeDelivered({required this.code});

  @override
  List<Object?> get props => [];
}
