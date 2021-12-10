import 'package:equatable/equatable.dart';

abstract class DepositedEvent extends Equatable {
  const DepositedEvent();
}

class UpdateStatusOrder extends DepositedEvent{
  final String code;

  UpdateStatusOrder({required this.code});

  @override
  List<Object?> get props => [code];
}
