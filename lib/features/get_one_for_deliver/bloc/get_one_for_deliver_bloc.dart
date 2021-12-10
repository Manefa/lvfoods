import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/bloc/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/get_one_for_deliver.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/usecases/get_one_for_deliver.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String NETWORK_FAILURE_MESSAGE = 'Network Failure';

class GetOneForDeliverBloc extends Bloc<GetOneForDeliverEvent, GetOneForDeliverState> {
  final GetOneForDeliverUseCase _getOneForDeliverUseCase;

  GetOneForDeliverBloc({required GetOneForDeliverUseCase getOneForDeliverUseCase})
      : assert(getOneForDeliverUseCase != null),
        _getOneForDeliverUseCase = getOneForDeliverUseCase, super(GetOneForDeliverEmpty());

  GetOneForDeliverState get initialState => GetOneForDeliverEmpty();

  @override
  Stream<GetOneForDeliverState> mapEventToState(
      GetOneForDeliverEvent event,
      ) async* {
    if(event is EventGetOneForDeliver){
      yield GetOneForDeliverLoading();
      final failureOrGetOneForDeliver = await _getOneForDeliverUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrGetOneForDeliver);
    }
  }
}

Stream<GetOneForDeliverState> _eitherLoadedOrErrorState(
    Either<Failure, GetOneForDeliver> either,
    ) async* {
  yield either.fold(
        (failure) => GetOneForDeliverError(message: _mapFailureToMessage(failure)),
        (getOneForDeliver) => GetOneForDeliverLoaded(getOneForDeliver: getOneForDeliver),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case ConnectionFailure:
      return NETWORK_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}

