
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/bloc/get_city.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/entities/city_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_city/domain/usecases/get_city.dart';

import '../../../../core/usecases/restaurant/get_city/get_city.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class GetCityBloc extends Bloc<GetCityEvent, GetCityState> {
  final GetCityUseCase _getCityUseCase;
  GetCityBloc({ required GetCityUseCase getCityUseCase})
      :assert(getCityUseCase!=null),
  _getCityUseCase = getCityUseCase,
        super(GetCityEmpty());

  @override
  Stream<GetCityState> mapEventToState(GetCityEvent event) async*{
    if(event is StartGetCity) {
      yield GetCityLoading();
      final failureOrGetStylesResponse = await _getCityUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrGetStylesResponse);
    }
  }
}

Stream<GetCityState> _eitherLoadedOrErrorState(
    Either<Failure, CityMaster> either,
    ) async* {
  yield either.fold(
        (failure) => GetCityError(message: _mapFailureToMessage(failure)),
        (cityMaster) => GetCityLoaded(cityMaster: cityMaster),
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
