import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/bloc/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/entities/start_recovery.dart';
import 'package:ivfoods_mobile_app/features/start_recovery/domain/usecases/start_recovery.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class StartRecoveryBloc extends Bloc<StartRecoveryEvent, StartRecoveryState> {
  final StartRecoveryUseCase _startRecoveryUseCase;
  StartRecoveryBloc({required StartRecoveryUseCase startRecoveryUseCase})
      :assert(startRecoveryUseCase != null),
  _startRecoveryUseCase = startRecoveryUseCase,super(EmptyStartRecovery());

  @override
  Stream<StartRecoveryState> mapEventToState(StartRecoveryEvent event,) async* {
    if(event is UpdateStatusOrders){
      yield LoadingStartRecovery();
      final failureOrStartRecoveryResponse = await _startRecoveryUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrStartRecoveryResponse);
    }
  }
}

Stream<StartRecoveryState> _eitherLoadedOrErrorState(
    Either<Failure, StartRecovery> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorStartRecovery(message: _mapFailureToMessage(failure)),
        (startRecovery) => LoadedStartRecovery(startRecovery: startRecovery),
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
