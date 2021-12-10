import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/orders_usecases/get_orders_usecase.dart';
import 'package:ivfoods_mobile_app/features/orders/bloc/orders.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/entities/orders_masters.dart';
import 'package:ivfoods_mobile_app/features/orders/domain/usecases/get_orders.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrdersUseCase _getOrdersUseCase;

  OrdersBloc({required GetOrdersUseCase getOrdersUseCase})
      : assert(getOrdersUseCase != null),
  _getOrdersUseCase = getOrdersUseCase, super(EmptyOrders());

  OrdersState get initialState => EmptyOrders();

  @override
  Stream<OrdersState> mapEventToState(
    OrdersEvent event,
  ) async* {
    if(event is GetOrders){
      yield LoadingOrders();
      final failureOrOrders = await _getOrdersUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrOrders);
    }
  }
}

Stream<OrdersState> _eitherLoadedOrErrorState(
    Either<Failure, OrdersMasters> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorOrders(message: _mapFailureToMessage(failure)),
        (orders) => LoadedOrders(ordersMasters: orders),
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
