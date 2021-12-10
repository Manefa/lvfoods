import 'package:equatable/equatable.dart';

abstract class OnTheWayEvent extends Equatable {
  const OnTheWayEvent();
}

class OnTheWayLaunch extends OnTheWayEvent{
  final String code;

  OnTheWayLaunch({required this.code});

  @override
  List<Object?> get props => [code];
}

