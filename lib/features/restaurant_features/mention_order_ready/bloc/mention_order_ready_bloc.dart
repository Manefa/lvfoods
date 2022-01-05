
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/bloc/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/entities/mention_order_ready.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/usecases/mention_order_ready.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class MentionOrderReadyBloc extends Bloc<MentionOrderReadyEvent, MentionOrderReadyState> {
  final MentionOrderReadyUseCase _mentionOrderReadyUseCase;
  MentionOrderReadyBloc({required MentionOrderReadyUseCase mentionOrderReadyUseCase})
      :assert(mentionOrderReadyUseCase != null),
        _mentionOrderReadyUseCase = mentionOrderReadyUseCase,
        super(EmptyMentionOrderReady());

  @override
  Stream<MentionOrderReadyState> mapEventToState(MentionOrderReadyEvent event,) async* {
    if(event is StartMentionOrderReady){
      yield LoadingMentionOrderReady();
      final failureOrMentionOrderReadyResponse = await _mentionOrderReadyUseCase(Params(code: event.code));
      yield* _eitherLoadedOrErrorState(failureOrMentionOrderReadyResponse);
    }
  }
}

Stream<MentionOrderReadyState> _eitherLoadedOrErrorState(
    Either<Failure, MentionOrderReady> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorMentionOrderReady(message: _mapFailureToMessage(failure)),
        (mentionOrderReady) => LoadedMentionOrderReady(mentionOrderReady: mentionOrderReady),
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
