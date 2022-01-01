
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/bloc/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/entities/remove_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_hours/domain/usecases/remove_hours.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class RemoveHoursBloc extends Bloc<RemoveHoursEvent, RemoveHoursState> {
  final RemoveHoursUseCase _removeHoursUseCase;
  RemoveHoursBloc({required RemoveHoursUseCase removeHoursUseCase}) :
        assert(removeHoursUseCase != null),
  _removeHoursUseCase = removeHoursUseCase,
        super(RemoveHoursEmpty());

  @override
  Stream<RemoveHoursState> mapEventToState(RemoveHoursEvent event) async*{
    if(event is StartRemoveHours){
      yield RemoveHoursLoading();
      final failureOrRemoveHoursResponse = await _removeHoursUseCase(Params(hours: event.hours, name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrRemoveHoursResponse);
    }
  }
}

Stream<RemoveHoursState> _eitherLoadedOrErrorState(
    Either<Failure, RemoveHours> either,
    ) async* {
  yield either.fold(
        (failure) => RemoveHoursError(message: _mapFailureToMessage(failure)),
        (hours) => RemoveHoursLoaded(hours: hours),
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
