import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/bloc/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/entities/start_deposition.dart';
import 'package:ivfoods_mobile_app/features/start_deposition/domain/usecases/start_deposition.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class StartDepositionBloc extends Bloc<StartDepositionEvent, StartDepositionState> {
  final StartDepositionUseCase _startDepositionUseCase;
  StartDepositionBloc({required StartDepositionUseCase startDepositionUseCase})
      :assert(startDepositionUseCase != null),
  _startDepositionUseCase = startDepositionUseCase,
        super(EmptyStartDeposition());

  @override
  Stream<StartDepositionState> mapEventToState(
    StartDepositionEvent event,
  ) async* {
    if(event is UpdateStatusOrder){
      yield LoadingStartDeposition();
      final failureOrStartDepositionResponse = await _startDepositionUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrStartDepositionResponse);
    }
  }
}

Stream<StartDepositionState> _eitherLoadedOrErrorState(
    Either<Failure, StartDeposition> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorStartDeposition(message: _mapFailureToMessage(failure)),
        (startDeposition) => LoadedStartDeposition(startDeposition: startDeposition),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
