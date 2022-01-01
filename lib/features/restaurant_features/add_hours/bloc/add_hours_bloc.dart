
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/bloc/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/entities/add_hours.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_hours/domain/usecases/add_hours.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class AddHoursBloc extends Bloc<AddHoursEvent, AddHoursState> {
  final AddHoursUseCase _addHoursUseCase;
  AddHoursBloc({required AddHoursUseCase addHoursUseCase}) :
        assert(addHoursUseCase != null),
  _addHoursUseCase = addHoursUseCase,
        super(AddHoursEmpty());

  @override
  Stream<AddHoursState> mapEventToState(AddHoursEvent event) async*{
    if(event is StartAddHours){
      yield AddHoursLoading();
      final failureOrAddHoursResponse = await _addHoursUseCase(Params(addHours: event.addHours, name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrAddHoursResponse);
    }
  }
}

Stream<AddHoursState> _eitherLoadedOrErrorState(
    Either<Failure, AddHours> either,
    ) async* {
  yield either.fold(
        (failure) => AddHoursError(message: _mapFailureToMessage(failure)),
        (hours) => AddHoursLoaded(hours: hours),
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
