import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/update_password/bloc/update_password.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/entities/update_password_master.dart';
import 'package:ivfoods_mobile_app/features/update_password/domain/usecases/update_password.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CONNECTION_FAILURE_MESSAGE = 'Connection Failure';

class UpdatePasswordBloc extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  final UpdatePasswordUseCase _updatePasswordUseCase;
  UpdatePasswordBloc({required UpdatePasswordUseCase updatePasswordUseCase})
      :assert(updatePasswordUseCase != null),
  _updatePasswordUseCase = updatePasswordUseCase,
        super(UpdatePasswordEmpty());

  @override
  Stream<UpdatePasswordState> mapEventToState(UpdatePasswordEvent event) async* {
    if(event is LaunchUpdatePassword){
      yield UpdatePasswordLoading();
      final failureOrDeliveryPaidResponse = await _updatePasswordUseCase(Params(sendPassword: event.sendPassword));
      yield* _eitherLoadedOrErrorState(failureOrDeliveryPaidResponse);
    }
  }
}

Stream<UpdatePasswordState> _eitherLoadedOrErrorState(
    Either<Failure, UpdatePasswordMaster> either,
    ) async* {
  yield either.fold(
        (failure) => UpdatePasswordError(message: _mapFailureToMessage(failure)),
        (userUpdate) => UpdatePasswordLoaded( updatePasswordMaster: userUpdate),
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
