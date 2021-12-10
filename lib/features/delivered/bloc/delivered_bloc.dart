import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/delivered/bloc/delivered.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/entities/delivered.dart';
import 'package:ivfoods_mobile_app/features/delivered/domain/usecases/delivered.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class DeliveredBloc extends Bloc<DeliveredEvent, DeliveredState> {
  final DeliveredUseCase _deliveredUseCase;
  DeliveredBloc({required DeliveredUseCase deliveredUseCase})
      :assert(deliveredUseCase != null),
  _deliveredUseCase= deliveredUseCase,
        super(DeliveredEmpty());

  @override
  Stream<DeliveredState> mapEventToState(DeliveredEvent event) async*{
    if(event is MakeDelivered){
      yield DeliveredLoading();
      final failureOrDeliveredResponse = await _deliveredUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrDeliveredResponse);
    }
  }
}

Stream<DeliveredState> _eitherLoadedOrErrorState(
    Either<Failure, Delivered> either,
    ) async* {
  yield either.fold(
        (failure) => DeliveredError(message: _mapFailureToMessage(failure)),
        (delivered) => DeliveredLoaded(delivered: delivered),
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
