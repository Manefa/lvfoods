import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LocaleState extends Equatable {
  final Locale locale;
  const LocaleState(this.locale);
}

class SelectedLocale extends LocaleState {
  SelectedLocale(Locale locale) : super(locale);

  @override
  List<Object> get props => [locale];
}
