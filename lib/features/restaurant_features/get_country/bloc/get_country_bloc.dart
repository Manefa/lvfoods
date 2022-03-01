
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/bloc/get_country.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/entities/country_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_country/domain/usecases/get_country.dart';

import '../../../../core/usecases/restaurant/get_country/get_country.dart';


const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class GetCountryBloc extends Bloc<GetCountryEvent, GetCountryState> {
  final GetCountryUseCase _getCountryUseCase;
  GetCountryBloc({ required GetCountryUseCase getCountryUseCase})
      :assert(getCountryUseCase!=null),
  _getCountryUseCase = getCountryUseCase,
        super(GetCountryEmpty());

  @override
  Stream<GetCountryState> mapEventToState(GetCountryEvent event) async*{
    if(event is StartGetCountry) {
      yield GetCountryLoading();
      final failureOrGetStylesResponse = await _getCountryUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrGetStylesResponse);
    }
  }
}

Stream<GetCountryState> _eitherLoadedOrErrorState(
    Either<Failure, CountryMaster> either,
    ) async* {
  yield either.fold(
        (failure) => GetCountryError(message: _mapFailureToMessage(failure)),
        (countryMaster) => GetCountryLoaded(countryMaster: countryMaster),
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
