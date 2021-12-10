import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ivfoods_mobile_app/core/error/failures.dart';
import 'package:ivfoods_mobile_app/features/auth/blocs/sign_in/Sign_in.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/entities/sign_in_response.dart';
import 'package:ivfoods_mobile_app/features/auth/domain/usecases/sign_in.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String SERVER_FAILURE_MESSAGE = 'Echec verifier vos identifiants';
const String CONNECTION_FAILURE_MESSAGE = 'Echec verifier votre connetion internet';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase launchSignIn;
  SignInBloc({required SignInUseCase signIn})
      : assert(signIn != null),
        launchSignIn = signIn,
        super(SignInInitial());

  SignInState get initialState => SignInInitial();

  @override
  Stream<SignInState> mapEventToState( SignInEvent event,) async* {
    if(event is Submitted){
      yield SignInLoading();
      final failureOrSignInResponse = await launchSignIn(Params(signInUser: event.signInUser));
      yield* _eitherLoadedOrErrorState(failureOrSignInResponse);
    }
  }
}

Stream<SignInState> _eitherLoadedOrErrorState(
    Either<Failure, SignInResponse> either,
    ) async* {
  yield either.fold(
          (failure) => SignInError(message: _mapFailureToMessage(failure)),
          (signInResponse) {
            sl<SharedPreferences>().setString("token", signInResponse.token!);
            sl<SharedPreferences>().setString("success", signInResponse.success.toString());
          return SignInSuccess();
      }
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case ConnectionFailure:
      return CONNECTION_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
