import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/on_the_way/domain/entities/on_the_way.dart';

abstract class OnTheWayState extends Equatable {
  const OnTheWayState();
}

class OnTheWayEmpty extends OnTheWayState {
  @override
  List<Object> get props => [];
}

class OnTheWayLoading extends OnTheWayState {
  @override
  List<Object> get props => [];
}

class OnTheWayLoaded extends OnTheWayState {
  final OnTheWay onTheWay;

  OnTheWayLoaded({required this.onTheWay});
  @override
  List<Object> get props => [onTheWay];
}

class OnTheWayError extends OnTheWayState {
  final String message;

  OnTheWayError({required this.message});

  @override
  List<Object> get props => [message];
}