
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/bloc/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/entities/get_product_details.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_product_details/domain/usecases/get_product_details.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class GetProductDetailsBloc extends Bloc<GetProductDetailsEvent, GetProductDetailsState> {
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  GetProductDetailsBloc({required GetProductDetailsUseCase getProductDetailsUseCase})
      :assert(getProductDetailsUseCase != null),
  _getProductDetailsUseCase = getProductDetailsUseCase,
        super(GetProductDetailsEmpty());

  @override
  Stream<GetProductDetailsState> mapEventToState(GetProductDetailsEvent event) async* {
    if(event is StartGetProductDetails){
      yield GetProductDetailsLoading();
      final failureOrGetProductDetailsResponse = await _getProductDetailsUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrGetProductDetailsResponse);
    }
  }
}

Stream<GetProductDetailsState> _eitherLoadedOrErrorState(
    Either<Failure, GetProductDetails> either,
    ) async* {
  yield either.fold(
        (failure) => GetProductDetailsError(message: _mapFailureToMessage(failure)),
        (getProductDetails) => GetProductDetailsLoaded(getProductDetails: getProductDetails),
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
