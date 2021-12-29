import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/bloc/add_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/entities/create_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/add_restaurant/domain/usecases/add_restaurant.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class AddRestaurantBloc extends Bloc<AddRestaurantEvent, AddRestaurantState> {
  final AddRestaurantUseCase _addRestaurantUseCase;
  AddRestaurantBloc({required AddRestaurantUseCase addRestaurantUseCase})
      :assert(addRestaurantUseCase!=null),
  _addRestaurantUseCase = addRestaurantUseCase,
        super(AddRestaurantEmpty());

  @override
  Stream<AddRestaurantState> mapEventToState(AddRestaurantEvent event)  async*{
    if(event is StartAddRestaurant){
      yield AddRestaurantLoading();
      final failureOrAddRestaurantResponse = await _addRestaurantUseCase(Params(createRestaurant: event.createRestaurant));
      yield* _eitherLoadedOrErrorState(failureOrAddRestaurantResponse);
    }
  }
}

Stream<AddRestaurantState> _eitherLoadedOrErrorState(
    Either<Failure, CreateRestaurant> either,
    ) async* {
  yield either.fold(
        (failure) => AddRestaurantError(message: _mapFailureToMessage(failure)),
        (createRestaurant) => AddRestaurantLoaded(createRestaurant: createRestaurant),
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
