import 'package:equatable/equatable.dart';

abstract class GetOneForDeliverEvent extends Equatable {
  const GetOneForDeliverEvent();
}

class EventGetOneForDeliver extends GetOneForDeliverEvent{
  final String code;

  EventGetOneForDeliver({required this.code});

  @override
  List<Object?> get props => [];
}
