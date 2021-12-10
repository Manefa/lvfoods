import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/bloc/paid_delivery.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/entities/paid_delivery_master.dart';
import 'package:ivfoods_mobile_app/features/paid_delivery/domain/usecases/paid_delivery.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class PaidDeliveryBloc extends Bloc<PaidDeliveryEvent, PaidDeliveryState> {
  final PaidDeliveryUseCase _paidDeliveryUseCase;
  PaidDeliveryBloc({required PaidDeliveryUseCase paidDeliveryUseCase})
      :assert( paidDeliveryUseCase!= null),
  _paidDeliveryUseCase = paidDeliveryUseCase,
        super(PaidDeliveryEmpty());

  @override
  Stream<PaidDeliveryState> mapEventToState(PaidDeliveryEvent event) async*{
    if(event is StartPaidDelivery){
      yield PaidDeliveryLoading();
      final failureOrDeliveryPaidResponse = await _paidDeliveryUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrDeliveryPaidResponse);
    }
  }
}

Stream<PaidDeliveryState> _eitherLoadedOrErrorState(
    Either<Failure, PaidDeliveryMaster> either,
    ) async* {
  yield either.fold(
        (failure) => PaidDeliveryError(message: _mapFailureToMessage(failure)),
        (paidDelivery) => PaidDeliveryLoaded(paidDeliveryMaster: paidDelivery),
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

