import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/deliveries_usecases/get_deliveries_usecase.dart';
import 'package:ivfoods_mobile_app/features/deliveries/bloc/deliveries.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/entities/deliveries_master.dart';
import 'package:ivfoods_mobile_app/features/deliveries/domain/usecases/get_deliveries.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class DeliveriesBloc extends Bloc<DeliveriesEvent, DeliveriesState> {
   final GetDeliveriesUseCase _getDeliveriesUseCase;

  DeliveriesBloc({ required GetDeliveriesUseCase getDeliveriesUseCase})
      :assert(getDeliveriesUseCase != null),
      _getDeliveriesUseCase = getDeliveriesUseCase,
      super(EmptyDeliveries());

   DeliveriesState get initialState => EmptyDeliveries();

  @override
  Stream<DeliveriesState> mapEventToState(
    DeliveriesEvent event,
  ) async* {
    if(event is GetDeliveries){
      yield LoadingDeliveries();
      final failureOrDeliveries = await _getDeliveriesUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrDeliveries);
    }
  }
}

Stream<DeliveriesState> _eitherLoadedOrErrorState(
    Either<Failure, DeliveriesMasters> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorDeliveries(message: _mapFailureToMessage(failure)),
        (deliveries) => LoadedDeliveries(deliveriesMasters: deliveries),
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
