
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/mention_order_ready/domain/entities/mention_order_ready.dart';

abstract class MentionOrderReadyState extends Equatable {
  const MentionOrderReadyState();
}

class EmptyMentionOrderReady extends MentionOrderReadyState {
  @override
  List<Object> get props => [];
}

class LoadingMentionOrderReady extends MentionOrderReadyState {
  @override
  List<Object> get props => [];
}

class LoadedMentionOrderReady extends MentionOrderReadyState {
  final MentionOrderReady mentionOrderReady;

  LoadedMentionOrderReady({required this.mentionOrderReady});

  @override
  List<Object> get props => [mentionOrderReady];
}

class ErrorMentionOrderReady extends MentionOrderReadyState {
  final String message;

  ErrorMentionOrderReady({required this.message});

  @override
  List<Object> get props => [message];
}


