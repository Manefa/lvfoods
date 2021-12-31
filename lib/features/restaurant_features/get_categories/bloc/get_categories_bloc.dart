
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_categories/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/bloc/get_categories.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/entities/get_categories_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_categories/domain/usecases/get_categories.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  GetCategoriesBloc({required GetCategoriesUseCase getCategoriesUseCase}) :
        assert(getCategoriesUseCase!=null),
  _getCategoriesUseCase = getCategoriesUseCase,
        super(GetCategoriesEmpty());

  @override
  Stream<GetCategoriesState> mapEventToState(GetCategoriesEvent event) async*{
    if(event is StartGetCategories) {
      yield GetCategoriesLoading();
      final failureOrGetCategoriesResponse = await _getCategoriesUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrGetCategoriesResponse);
    }
  }
}

Stream<GetCategoriesState> _eitherLoadedOrErrorState(
    Either<Failure, GetCategoriesMaster> either,
    ) async* {
  yield either.fold(
        (failure) => GetCategoriesError(message: _mapFailureToMessage(failure)),
        (getCategoriesMaster) => GetCategoriesLoaded(getCategoriesMaster: getCategoriesMaster),
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
