import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';

abstract class DepositedState extends Equatable {
  const DepositedState();
}

class EmptyDeposited extends DepositedState {
  @override
  List<Object> get props => [];
}

class LoadingDeposited extends DepositedState {
  @override
  List<Object> get props => [];
}

class LoadedDeposited extends DepositedState {
  final Deposited deposited;

  LoadedDeposited({required this.deposited});

  @override
  List<Object> get props => [deposited];
}

class ErrorDeposited extends DepositedState {
  final String message;

  ErrorDeposited({required this.message});

  @override
  List<Object> get props => [message];
}
