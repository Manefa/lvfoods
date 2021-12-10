
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';

abstract class StartDepositionState extends Equatable {
  const StartDepositionState();
}

class EmptyStartDeposition extends StartDepositionState {
  @override
  List<Object> get props => [];
}

class LoadingStartDeposition extends StartDepositionState {
  @override
  List<Object> get props => [];
}

class LoadedStartDeposition extends StartDepositionState {
  final StartDeposition startDeposition;

  LoadedStartDeposition({required this.startDeposition});
  @override
  List<Object> get props => [startDeposition];
}

class ErrorStartDeposition extends StartDepositionState {
  final String message;

  ErrorStartDeposition({required this.message});

  @override
  List<Object> get props => [message];
}
