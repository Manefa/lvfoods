import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/entities/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/bloc/on_the_way.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/usecases/on_the_way.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class OnTheWayBloc extends Bloc<OnTheWayEvent, OnTheWayState> {
  final OnTheWayUseCase _onTheWayUseCase;
  OnTheWayBloc({required OnTheWayUseCase onTheWayUseCase})
      :assert(onTheWayUseCase != null),
  _onTheWayUseCase = onTheWayUseCase,
        super(OnTheWayEmpty());

  @override
  Stream<OnTheWayState> mapEventToState(OnTheWayEvent event) async* {
    if(event is OnTheWayLaunch){
      yield OnTheWayLoading();
      final failureOrOnTheWayResponse = await _onTheWayUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrOnTheWayResponse);
    }
  }
}

Stream<OnTheWayState> _eitherLoadedOrErrorState(
    Either<Failure, OnTheWay> either,
    ) async* {
  yield either.fold(
        (failure) => OnTheWayError(message: _mapFailureToMessage(failure)),
        (onTheWay) => OnTheWayLoaded(onTheWay: onTheWay),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CONNECTION_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
