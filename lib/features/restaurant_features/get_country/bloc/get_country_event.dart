import 'package:equatable/equatable.dart';

abstract class GetCountryEvent extends Equatable {
  const GetCountryEvent();
}

class StartGetCountry extends GetCountryEvent{

  @override
  List<Object?> get props => [];
}
