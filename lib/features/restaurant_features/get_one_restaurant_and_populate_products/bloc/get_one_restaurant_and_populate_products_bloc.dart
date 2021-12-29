import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/bloc/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/entities/get_one_restaurant_and_populate_products.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_one_restaurant_and_populate_products/domain/usecases/get_one_restaurant_and_populate_products.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class GetOneRestaurantAndPopulateProductsBloc extends Bloc<GetOneRestaurantAndPopulateProductsEvent, GetOneRestaurantAndPopulateProductsState> {
  final GetOneRestaurantAndPopulateProductsUseCase _getOneRestaurantAndPopulateProductsUseCase;
  GetOneRestaurantAndPopulateProductsBloc({required GetOneRestaurantAndPopulateProductsUseCase getOneRestaurantAndPopulateProductsUseCase})
      :assert(getOneRestaurantAndPopulateProductsUseCase != null),
  _getOneRestaurantAndPopulateProductsUseCase = getOneRestaurantAndPopulateProductsUseCase,
        super(GetOneRestaurantAndPopulateProductsEmpty());

  @override
  Stream<GetOneRestaurantAndPopulateProductsState> mapEventToState(GetOneRestaurantAndPopulateProductsEvent event) async* {
    if(event is StartGetOneRestaurantAndPopulateProducts){
      yield GetOneRestaurantAndPopulateProductsLoading();
      final failureOrGetOneRestaurantAndPopulateProductsResponse = await _getOneRestaurantAndPopulateProductsUseCase(Params(restaurantName: event.restaurantName));
      yield* _eitherLoadedOrErrorState(failureOrGetOneRestaurantAndPopulateProductsResponse);
    }
  }
}

Stream<GetOneRestaurantAndPopulateProductsState> _eitherLoadedOrErrorState(
    Either<Failure, GetOneRestaurantAndPopulateProducts> either,
    ) async* {
  yield either.fold(
        (failure) => GetOneRestaurantAndPopulateProductsError(message: _mapFailureToMessage(failure)),
        (getOneRestaurantAndPopulateProducts) => GetOneRestaurantAndPopulateProductsLoaded(getOneRestaurantAndPopulateProducts: getOneRestaurantAndPopulateProducts),
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

