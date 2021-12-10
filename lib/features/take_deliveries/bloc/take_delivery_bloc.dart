
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/bloc/take_delivery.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/entities/take_delivery_master.dart';
import 'package:ivfoods_mobile_app/features/take_deliveries/domain/usecases/take_delivery.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class TakeDeliveryBloc extends Bloc<TakeDeliveryEvent, TakeDeliveryState> {
  final TakeDeliveryUseCase _takeDeliveryUseCase;
  TakeDeliveryBloc({ required TakeDeliveryUseCase takeDeliveryUseCase})
      :assert(takeDeliveryUseCase != null),
        _takeDeliveryUseCase = takeDeliveryUseCase,
        super(TakeDeliveryEmpty());

  @override
  Stream<TakeDeliveryState> mapEventToState(TakeDeliveryEvent event) async* {
    if(event is TakeDelivery) {
      yield TakeDeliveryLoading();
      final failureOrTakeDeliveryResponse = await _takeDeliveryUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrTakeDeliveryResponse);
    }
  }

  Stream<TakeDeliveryState> _eitherLoadedOrErrorState(
      Either<Failure, TakeDeliveryMaster> either,
      ) async* {
    yield either.fold(
          (failure) => TakeDeliveryError(message: _mapFailureToMessage(failure)),
          (takeDelivery) => TakeDeliveryLoaded(takeDeliveryMaster: takeDelivery),
    );
  }
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
