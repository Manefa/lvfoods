import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/bloc/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/entities/get_all_for_restaurant.dart';
import 'package:ivfoods_mobile_app/features/get_all_for_restaurant/domain/usecases/get_all_for_restaurant.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String NETWORK_FAILURE_MESSAGE = 'Network Failure';

class GetAllForRestaurantBloc extends Bloc<GetAllForRestaurantEvent, GetAllForRestaurantState> {
  final GetAllForRestaurantUseCase _getAllForRestaurantUseCase;

  GetAllForRestaurantBloc({required GetAllForRestaurantUseCase getAllForRestaurantUseCase})
      : assert(getAllForRestaurantUseCase != null),
        _getAllForRestaurantUseCase = getAllForRestaurantUseCase,
        super(EmptyGetAllForRestaurant());

  @override
  Stream<GetAllForRestaurantState> mapEventToState(
    GetAllForRestaurantEvent event,
  ) async* {
    if(event is GetGetAllForRestaurantEvent){
      yield LoadingGetAllForRestaurant();
      final failureOrGetAllForRestaurant = await _getAllForRestaurantUseCase(Params(restaurantName: event.restaurantName));
      yield* _eitherLoadedOrErrorState(failureOrGetAllForRestaurant);
    }
  }
}

Stream<GetAllForRestaurantState> _eitherLoadedOrErrorState(
    Either<Failure, GetAllForRestaurant> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorGetAllForRestaurant(message: _mapFailureToMessage(failure)),
        (getAllForRestaurant) => LoadedGetAllForRestaurant(getAllForRestaurant: getAllForRestaurant),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case ConnectionFailure:
      return NETWORK_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
