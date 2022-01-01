
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/bloc/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/entities/remove_phone.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/remove_phone/domain/usecases/remove_phone.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class RemovePhoneBloc extends Bloc<RemovePhoneEvent, RemovePhoneState> {
  final RemovePhoneUseCase _removePhoneUseCase;
  RemovePhoneBloc({required RemovePhoneUseCase removePhoneUseCase}) :
        assert(removePhoneUseCase != null),
  _removePhoneUseCase = removePhoneUseCase,
        super(RemovePhoneEmpty());

  @override
  Stream<RemovePhoneState> mapEventToState(RemovePhoneEvent event) async*{
    if(event is StartRemovePhone){
      yield RemovePhoneLoading();
      final failureOrRemovePhoneResponse = await _removePhoneUseCase(Params(phone: event.phone, name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrRemovePhoneResponse);
    }
  }
}

Stream<RemovePhoneState> _eitherLoadedOrErrorState(
    Either<Failure, RemovePhone> either,
    ) async* {
  yield either.fold(
        (failure) => RemovePhoneError(message: _mapFailureToMessage(failure)),
        (phone) => RemovePhoneLoaded(phone: phone),
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
