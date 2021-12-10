import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/core/usecases/get_user/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/bloc/get_user.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/entities/user_master.dart';
import 'package:ivfoods_mobile_app/features/get_user/domain/usecases/get_user.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GetUserUseCase _getUserUseCase;
  GetUserBloc({required GetUserUseCase getUserUseCase})
      :assert(getUserUseCase != null),
  _getUserUseCase = getUserUseCase,
       super(EmptyUser());

  @override
  Stream<GetUserState> mapEventToState(
    GetUserEvent event,
  ) async* {
    if(event is GetUser){
      yield LoadingUser();
      final failureOrUser = await _getUserUseCase(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrUser);
    }
  }
}

Stream<GetUserState> _eitherLoadedOrErrorState(
    Either<Failure, UserMaster> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorUser(message: _mapFailureToMessage(failure)),
        (userMaster) => LoadedUser(userMaster: userMaster),
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
