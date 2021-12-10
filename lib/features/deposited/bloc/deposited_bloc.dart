import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/deposited/bloc/deposited.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/entities/deposited.dart';
import 'package:ivfoods_mobile_app/features/deposited/domain/usecases/deposited.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class DepositedBloc extends Bloc<DepositedEvent, DepositedState> {
  final DepositedUseCase _depositedUseCase;
  DepositedBloc({required DepositedUseCase depositedUseCase})
      :assert(depositedUseCase != null,),
        _depositedUseCase = depositedUseCase,
        super(EmptyDeposited());

  @override
  Stream<DepositedState> mapEventToState(
    DepositedEvent event,
  ) async* {
    if(event is UpdateStatusOrder){
      yield LoadingDeposited();
      final failureOrDepositedResponse = await _depositedUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrDepositedResponse);
    }
  }
}

Stream<DepositedState> _eitherLoadedOrErrorState(
    Either<Failure, Deposited> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorDeposited(message: _mapFailureToMessage(failure)),
        (deposition) => LoadedDeposited(deposited: deposition),
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
