import 'package:equatable/equatable.dart';
import 'package:ivfoods_mobile_app/features/get_one_for_deliver/domain/entities/get_one_for_deliver.dart';

abstract class GetOneForDeliverState extends Equatable {
  const GetOneForDeliverState();
}

class GetOneForDeliverEmpty extends GetOneForDeliverState {
  @override
  List<Object> get props => [];
}

class GetOneForDeliverLoading extends GetOneForDeliverState {
  @override
  List<Object> get props => [];
}

class GetOneForDeliverLoaded extends GetOneForDeliverState {

  final GetOneForDeliver getOneForDeliver;

  GetOneForDeliverLoaded({required this.getOneForDeliver});
  @override
  List<Object> get props => [getOneForDeliver];
}

class GetOneForDeliverError extends GetOneForDeliverState {
  final String message;

  GetOneForDeliverError({required this.message});
  @override
  List<Object> get props => [message];
}
