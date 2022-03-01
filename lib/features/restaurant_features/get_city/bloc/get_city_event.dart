import 'package:equatable/equatable.dart';

abstract class GetCityEvent extends Equatable {
  const GetCityEvent();
}

class StartGetCity extends GetCityEvent{

  @override
  List<Object?> get props => [];
}
