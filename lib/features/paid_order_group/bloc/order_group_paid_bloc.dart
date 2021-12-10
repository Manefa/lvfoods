import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/bloc/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/entities/order_group_paid.dart';
import 'package:ivfoods_mobile_app/features/paid_order_group/domain/usecases/order_group_paid.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class OrderGroupPaidBloc extends Bloc<OrderGroupPaidEvent, OrderGroupPaidState> {
  final OrderGroupPaidUseCase _orderGroupPaidUseCase;
  OrderGroupPaidBloc({required OrderGroupPaidUseCase orderGroupPaidUseCase})
      :assert( orderGroupPaidUseCase!= null),
  _orderGroupPaidUseCase = orderGroupPaidUseCase,
        super(OrderGroupPaidEmpty());

  @override
  Stream<OrderGroupPaidState> mapEventToState(OrderGroupPaidEvent event) async*{
    if(event is PaidOrderGroup){
      yield OrderGroupPaidLoading();
      final failureOrOrderGroupPaidResponse = await _orderGroupPaidUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrOrderGroupPaidResponse);
    }
  }
}

Stream<OrderGroupPaidState> _eitherLoadedOrErrorState(
    Either<Failure, OrderGroupPaid> either,
    ) async* {
  yield either.fold(
        (failure) => OrderGroupPaidError(message: _mapFailureToMessage(failure)),
        (orderGroupPaid) => OrderGroupPaidLoaded(orderGroupPaid: orderGroupPaid),
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

