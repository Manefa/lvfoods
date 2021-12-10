import 'package:equatable/equatable.dart';

abstract class GetUserEvent extends Equatable {
  const GetUserEvent();
}

class GetUser extends GetUserEvent{
  @override
  List<Object?> get props => [];
}