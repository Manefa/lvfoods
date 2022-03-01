import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/bloc_localization/locale.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(SelectedLocale(Locale('fr')));

  @override
  Stream<LocaleState> mapEventToState(
      LocaleEvent event,
      ) async* {
    if(event is ToFrench){
      yield SelectedLocale(Locale('fr'));
    }else if(event is ToEnglish){
      yield SelectedLocale(Locale('en'));
    }
  }
}
