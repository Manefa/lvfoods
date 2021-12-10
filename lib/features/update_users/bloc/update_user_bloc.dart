import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/update_users/bloc/update_user.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/entities/user_master.dart';
import 'package:ivfoods_mobile_app/features/update_users/domain/usecases/update_user.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UpdateUserUseCase _updateUserUseCase;
  UpdateUserBloc({required UpdateUserUseCase updateUserUseCase})
      :assert(updateUserUseCase != null),
        _updateUserUseCase = updateUserUseCase,super(EmptyUpdateUser());

  @override
  Stream<UpdateUserState> mapEventToState(
      UpdateUserEvent event,
      ) async* {
    if(event is UpdateUser){
      yield LoadingUpdateUser();
      final failureOrUpdateUserResponse = await _updateUserUseCase(Params(userMaster: event.userForUpdate));
      yield* _eitherLoadedOrErrorState(failureOrUpdateUserResponse);
    }
  }
}

Stream<UpdateUserState> _eitherLoadedOrErrorState(
    Either<Failure, UserMaster> either,
    ) async* {
  yield either.fold(
        (failure) => ErrorUpdateUser(message: _mapFailureToMessage(failure)),
        (userUpdate) => LoadedUpdateUser(userMaster: userUpdate),
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

