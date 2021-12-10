import 'package:equatable/equatable.dart';

abstract class StartDepositionEvent extends Equatable {
  const StartDepositionEvent();
}

class UpdateStatusOrder extends StartDepositionEvent{
  final String code;

  UpdateStatusOrder({required this.code});

  @override
  List<Object?> get props => [code];
}
