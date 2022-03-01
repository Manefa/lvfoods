import 'package:equatable/equatable.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();
}

class ToFrench extends LocaleEvent{

  @override
  List<Object?> get props => [];
}

class ToEnglish extends LocaleEvent{

  @override
  List<Object?> get props => [];
}