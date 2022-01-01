
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/bloc/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/entities/update_restaurant.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/update_restaurant/domain/usecases/update_restaurant.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class UpdateRestaurantBloc extends Bloc<UpdateRestaurantEvent, UpdateRestaurantState> {
  final UpdateRestaurantUseCase _updateRestaurantUseCase;
  UpdateRestaurantBloc({required UpdateRestaurantUseCase updateRestaurantUseCase})
      :assert(updateRestaurantUseCase != null),
        _updateRestaurantUseCase = updateRestaurantUseCase,
        super(UpdateRestaurantEmpty());

  @override
  Stream<UpdateRestaurantState> mapEventToState(UpdateRestaurantEvent event)  async*{
    if(event is StartUpdateRestaurant){
      yield UpdateRestaurantLoading();
      final failureOrUpdateRestaurantResponse = await _updateRestaurantUseCase(Params(createRestaurant: event.updateRestaurant, name: event.name));
      yield* _eitherLoadedOrErrorState(failureOrUpdateRestaurantResponse);
    }
  }
}

Stream<UpdateRestaurantState> _eitherLoadedOrErrorState(
    Either<Failure, UpdateRestaurant> either,
    ) async* {
  yield either.fold(
        (failure) => UpdateRestaurantError(message: _mapFailureToMessage(failure)),
        (updateRestaurant) => UpdateRestaurantLoaded(updateRestaurant: updateRestaurant),
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
