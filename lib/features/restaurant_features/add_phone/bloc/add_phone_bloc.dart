import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/bloc/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/entities/add_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_phone/domain/usecases/add_phone.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class AddPhoneBloc extends Bloc<AddPhoneEvent, AddPhoneState> {
  final AddPhoneUseCase _addPhoneUseCase;
  AddPhoneBloc({required AddPhoneUseCase addPhoneUseCase}) :
        assert(addPhoneUseCase != null),
  _addPhoneUseCase = addPhoneUseCase,
        super(AddPhoneEmpty());

  @override
  Stream<AddPhoneState> mapEventToState(AddPhoneEvent event) async*{
    if(event is StartAddPhone){
      yield AddPhoneLoading();
      final failureOrAddPhoneResponse = await _addPhoneUseCase(Params(addPhone: event.addPhone, name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrAddPhoneResponse);
    }
  }
}

Stream<AddPhoneState> _eitherLoadedOrErrorState(
    Either<Failure, AddPhone> either,
    ) async* {
  yield either.fold(
        (failure) => AddPhoneError(message: _mapFailureToMessage(failure)),
        (phone) => AddPhoneLoaded(phone: phone),
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
