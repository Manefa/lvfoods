import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/bloc/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/entities/get_all_for_owner_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_all_for_owner_restaurant/domain/usecases/get_all_for_owner_restaurant.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class GetAllForOwnerRestaurantBloc extends Bloc<GetAllForOwnerRestaurantEvent, GetAllForOwnerRestaurantState> {
  final GetAllForOwnerRestaurantUseCase _getAllForOwnerRestaurantUseCase;
  GetAllForOwnerRestaurantBloc({required GetAllForOwnerRestaurantUseCase getAllForOwnerRestaurantUseCase})
      :assert(getAllForOwnerRestaurantUseCase != null),
  _getAllForOwnerRestaurantUseCase = getAllForOwnerRestaurantUseCase,
        super(GetAllForOwnerRestaurantEmpty());

  @override
  Stream<GetAllForOwnerRestaurantState> mapEventToState(GetAllForOwnerRestaurantEvent event) async*{
    if(event is StartGetAllForOwnerRestaurant) {
      yield GetAllForOwnerRestaurantLoading();
      final failureOrGetAllForOwnerRestaurantResponse = await _getAllForOwnerRestaurantUseCase(Params(name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrGetAllForOwnerRestaurantResponse);
    }
  }
}

Stream<GetAllForOwnerRestaurantState> _eitherLoadedOrErrorState(
    Either<Failure, GetAllForOwnerRestaurant> either,
    ) async* {
  yield either.fold(
        (failure) => GetAllForOwnerRestaurantError(message: _mapFailureToMessage(failure)),
        (getAllForOwnerRestaurant) => GetAllForOwnerRestaurantLoaded(getAllForOwnerRestaurant: getAllForOwnerRestaurant),
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
