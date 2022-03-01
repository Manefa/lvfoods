import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ivfoods_mobile_app/localization/app_localizations.dart';

class AppLocalisationSetup{
  static const Iterable<Locale> supportedLocales = [
    Locale('fr'),
    Locale('en'),
  ];

  static Iterable<LocalizationsDelegate<dynamic>> localizationDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Locale? localeResolutionCallback(Locale? locale, Iterable<Locale>? supportedLocales) {
    for(Locale supportedLocale in supportedLocales!) {
      if(supportedLocale.languageCode == locale!.languageCode && supportedLocale.countryCode == locale.countryCode){
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}