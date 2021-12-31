
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/restaurant/get_styles/get_styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/bloc/get_styles.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/get_styles_master.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/usecases/get_categories.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class GetStylesBloc extends Bloc<GetStylesEvent, GetStylesState> {
  final GetStylesUseCase _getStylesUseCase;
  GetStylesBloc({required GetStylesUseCase getStylesUseCase}) :
        assert(getStylesUseCase!=null),
  _getStylesUseCase = getStylesUseCase,
        super(GetStylesEmpty());

  @override
  Stream<GetStylesState> mapEventToState(GetStylesEvent event) async*{
    if(event is StartGetStyles) {
      yield GetStylesLoading();
      final failureOrGetStylesResponse = await _getStylesUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrGetStylesResponse);
    }
  }
}

Stream<GetStylesState> _eitherLoadedOrErrorState(
    Either<Failure, GetStylesMaster> either,
    ) async* {
  yield either.fold(
        (failure) => GetStylesError(message: _mapFailureToMessage(failure)),
        (getStylesMaster) => GetStylesLoaded(getStylesMaster: getStylesMaster),
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
