import 'package:equatable/equatable.dart';

abstract class StartRecoveryEvent extends Equatable {
  const StartRecoveryEvent();
}

class UpdateStatusOrders extends StartRecoveryEvent{
  final String code;

  UpdateStatusOrders({required this.code});

  @override
  List<Object?> get props => [code];
}
