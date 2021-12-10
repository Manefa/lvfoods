import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ivfoods_mobile_app/features/auth/blocs/auth/auth.dart';
import 'package:ivfoods_mobile_app/injection_container.dart';
import 'package:ivfoods_mobile_app/size_config.dart';
import 'package:ivfoods_mobile_app/ui/choose_profil/page/choose_profil.dart';
import 'package:ivfoods_mobile_app/ui/login/widgets/login_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthBloc _authBloc = sl<AuthBloc>();

  @override
  void initState() {
    _authBloc.add(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => _authBloc,
      child: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if(state is Uninitialized){
              return LoginScreen();
            } else if (state is Authenticated){
              return ChooseProfil();
            }else if(state is Unauthenticated){
              return LoginScreen();
            }
            return Container(
              child: Text("Default"),
            );
          },
        ),
      ),
    );
  }
}
