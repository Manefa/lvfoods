
import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/restaurant_features/get_styles/domain/entities/get_styles_master.dart';

abstract class GetStylesState extends Equatable {
  const GetStylesState();
}

class GetStylesEmpty extends GetStylesState {
  @override
  List<Object> get props => [];
}

class GetStylesLoading extends GetStylesState {
  @override
  List<Object> get props => [];
}

class GetStylesLoaded extends GetStylesState {
  final GetStylesMaster getStylesMaster;

  GetStylesLoaded({required this.getStylesMaster});
  @override
  List<Object> get props => [getStylesMaster];
}

class GetStylesError extends GetStylesState {
  final String message;

  GetStylesError({required this.message});
  @override
  List<Object> get props => [message];
}
