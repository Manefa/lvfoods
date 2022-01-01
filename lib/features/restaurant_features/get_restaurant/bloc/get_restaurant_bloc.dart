import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/bloc/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/entities/get_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_restaurant/domain/usecases/get_restaurant.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class GetRestaurantBloc extends Bloc<GetRestaurantEvent, GetRestaurantState> {
  final GetRestaurantUseCase _getRestaurantUseCase;
  GetRestaurantBloc({required GetRestaurantUseCase getRestaurantUseCase})
      : assert(getRestaurantUseCase != null),
  _getRestaurantUseCase = getRestaurantUseCase,
        super(GetRestaurantEmpty());

  @override
  Stream<GetRestaurantState> mapEventToState(GetRestaurantEvent event) async*{
    if(event is StartGetRestaurant) {
      yield GetRestaurantLoading();
      final failureOrGetRestaurantResponse = await _getRestaurantUseCase(Params(name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrGetRestaurantResponse);
    }
  }
}

Stream<GetRestaurantState> _eitherLoadedOrErrorState(
    Either<Failure, GetRestaurant> either,
    ) async* {
  yield either.fold(
        (failure) => GetRestaurantError(message: _mapFailureToMessage(failure)),
        (getRestaurant) => GetRestaurantLoaded(getRestaurant: getRestaurant),
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
