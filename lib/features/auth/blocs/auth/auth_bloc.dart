import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ivfoods_mobile_app/features/auth/blocs/auth/auth.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      :super(Uninitialized());

  AuthState get initialState => Uninitialized();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if(event is AppStarted){
      yield* _mapAppStartedToState();
    }else if(event is SignIn){
      yield* _mapSignInToState();
    }else if(event is SignOut){
      yield* _mapSignOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try{
      final success = (sl<SharedPreferences>().getString('success'));
      if(success == "true"){
        yield Authenticated();
      }else{
        yield Unauthenticated();
      }
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<AuthState> _mapSignInToState() async* {
    yield Authenticated();
  }

  _mapSignOutToState() {}
}
