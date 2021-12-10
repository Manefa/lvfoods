
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';

abstract class StartRecoveryState extends Equatable {
  const StartRecoveryState();
}

class EmptyStartRecovery extends StartRecoveryState {
  @override
  List<Object> get props => [];
}

class LoadingStartRecovery extends StartRecoveryState {
  @override
  List<Object> get props => [];
}

class LoadedStartRecovery extends StartRecoveryState {
  final StartRecovery startRecovery;

  LoadedStartRecovery({required this.startRecovery});

  @override
  List<Object> get props => [];
}

class ErrorStartRecovery extends StartRecoveryState {
  final String message;

  ErrorStartRecovery({required this.message});

  @override
  List<Object> get props => [message];
}


