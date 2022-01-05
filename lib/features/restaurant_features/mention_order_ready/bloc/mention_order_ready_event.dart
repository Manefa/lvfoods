import 'package:equatable/equatable.dart';

abstract class MentionOrderReadyEvent extends Equatable {
  const MentionOrderReadyEvent();
}

class StartMentionOrderReady extends MentionOrderReadyEvent{
  final String code;

  StartMentionOrderReady({required this.code});

  @override
  List<Object?> get props => [code];
}
